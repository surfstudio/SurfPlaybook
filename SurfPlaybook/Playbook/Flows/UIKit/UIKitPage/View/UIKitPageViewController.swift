//
//  UIKitPageViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitPageViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: UIKitPageViewOutput?

    // MARK: - Private Properties

    private var adapter: UIKitPageAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - UIKitPageViewInput

extension UIKitPageViewController: UIKitPageViewInput {

    func setupInitialState(page: PlaybookUIKitPage) {
        configureAppearance(page: page)
        adapter?.configure(with: page.viewModel)
    }

}

// MARK: - Appearance

private extension UIKitPageViewController {

    func configureAppearance(page: PlaybookUIKitPage) {
        configureNavigationBar(title: page.name)
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar(title: String) {
        navigationItem.title = title
    }

    func configureTableView() {
        tableView.apply(style: .default)
    }

    func configureAdapter() {
        adapter = UIKitPageAdapter(tableView: tableView)
    }

}
