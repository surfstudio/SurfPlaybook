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
    @IBOutlet private weak var emptyStateLabel: UILabel!

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
        if pages.isEmpty {
            setup(state: .empty(text: L10n.Main.EmptyState.message))
        } else {
            setup(state: .normal)
            adapter?.update(with: pages)
        }
    }

}

// MARK: - ViewStateConfigurable

extension UIKitViewController: ViewStateConfigurable {

    func setup(state: ViewState) {
        switch state {
        case .normal:
            emptyStateLabel.isHidden = true
            tableView.isHidden = false
        case .empty(let text):
            emptyStateLabel.isHidden = false
            tableView.isHidden = true
            emptyStateLabel.text = text
            emptyStateLabel.apply(style: .textRegular14GrayCenter)
        }
    }

}

// MARK: - Appearance

private extension UIKitViewController {

    func configureAppearance() {
        view.backgroundColor = Colors.Main.background
        configureNavigationBar()
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar() {
        navigationItem.title = StringsConfig.uiKitTabTitle
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
