//
//  ListAdapter.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 26.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ListAdapter: NSObject {

    // MARK: - Nested Types

    typealias ListData = (title: String, models: [ListTableViewCellModel])

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var data: [ListData] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(TitleTableViewCell.self)
        tableView.registerNib(ListTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Methods

    func update(with data: [ListData]) {
        self.data = data
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension ListAdapter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].models.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(TitleTableViewCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: data[indexPath.section].title)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(ListTableViewCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: data[indexPath.section].models[indexPath.row - 1])
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension ListAdapter: UITableViewDelegate {
}
