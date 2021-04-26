//
//  ListViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 26/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private Properties

    private var adapter: ListAdapter?

    // MARK: - Properties

    var output: ListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - ListViewInput

extension ListViewController: ListViewInput {

    func setupInitialState(with data: [ListAdapter.ListData]) {
        configureAppearance()
        adapter?.update(with: data)
    }

}

// MARK: - Appearance

private extension ListViewController {

    func configureAppearance() {
        configureNavigationBar()
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar() {
        navigationItem.title = "Список"
    }

    func configureTableView() {
        tableView.backgroundColor = Colors.Main.background
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0,
                                       left: 0,
                                       bottom: 30,
                                       right: 0)
    }

    func configureAdapter() {
        adapter = ListAdapter(tableView: tableView)
    }

}
