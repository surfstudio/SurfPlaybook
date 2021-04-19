//
//  FlowsAdapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class FlowsAdapter: NSObject {

    // MARK: - Properties

    var onSelectFlowCoordinator: Closure<String>?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var coordinators: [PlaybookFlowCoordinator] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(MenuItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Methods

    func fill(with flowCoordinators: [PlaybookFlowCoordinator]) {
        self.coordinators = flowCoordinators
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension FlowsAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coordinators.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let coordinator = coordinators[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(MenuItemCell.self, indexPath: indexPath)
        else {
            return UITableViewCell()
        }
        cell.configure(with: .init(text: coordinator.name))
        return cell
    }

}

// MARK: - UITableViewDelegate

extension FlowsAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator = coordinators[safe: indexPath.row] else {
            return
        }
        onSelectFlowCoordinator?(coordinator.id)
    }

}
