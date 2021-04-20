//
//  MainAdapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class MainAdapter: NSObject {

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var models: [ChapterModel] = []

    // MARK: - Properties

    var onPageSelect: Closure<PageModel>?

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(ChapterTableViewCell.self)
        tableView.dataSource = self
    }

    // MARK: - Methods

    func fill(with models: [ChapterModel]) {
        self.models = models
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension MainAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let model = models[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(ChapterTableViewCell.self, indexPath: indexPath)
        else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        cell.onPageSelect = { [weak self] page in
            self?.onPageSelect?(page)
        }
        return cell
    }

}
