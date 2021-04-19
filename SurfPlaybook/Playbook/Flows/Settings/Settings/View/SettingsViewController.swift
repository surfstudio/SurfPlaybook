//
//  SettingsViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: SettingsViewOutput?

    // MARK: - Private Properties

    private var adapter: SettingsAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - SettingsViewInput

extension SettingsViewController: SettingsViewInput {

    func setupInitialState(blocks: [SettingsBlock]) {
        configureAppearance()
        adapter?.fill(with: blocks)
    }

    func updateSetting(for block: SettingsBlock) {
        adapter?.updateSetting(for: block)
    }

}

// MARK: - Appearance

private extension SettingsViewController {

    func configureAppearance() {
        configureNavigationBar()
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar() {
        navigationItem.title = "Настройки"
    }

    func configureTableView() {
        tableView.apply(style: .default)
    }

    func configureAdapter() {
        adapter = SettingsAdapter(tableView: tableView)
        adapter?.onToggleRadioSetting = { [weak self] block in
            self?.output?.toggleSetting(for: block)
        }
    }

}
