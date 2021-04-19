//
//  UIKitViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: UIKitViewOutput?

    // MARK: - Private Properties

    private var adapter: UIKitAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - UIKitViewInput

extension UIKitViewController: UIKitViewInput {

    func setupInitialState(pages: [PlaybookUIKitPage]) {
        configureAppearance()
        adapter?.update(with: pages)
    }

}

// MARK: - Appearance

private extension UIKitViewController {

    func configureAppearance() {
        configureNavigationBar()
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar() {
        navigationItem.title = "UIKit"
    }

    func configureTableView() {
        tableView.apply(style: .default)
    }

    func configureAdapter() {
        adapter = UIKitAdapter(tableView: tableView)
        adapter?.onPageSelect = { [weak self] id in
            self?.output?.selectPage(id: id)
        }
    }

}
