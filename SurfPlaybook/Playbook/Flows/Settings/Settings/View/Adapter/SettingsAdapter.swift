//
//  SettingsAdapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class SettingsAdapter: NSObject {

    // MARK: - Properties

    var onToggleRadioSetting: Closure<SettingsBlock>?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var blocks: [SettingsBlock] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(RadioButtonCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Methods

    func fill(with blocks: [SettingsBlock]) {
        self.blocks = blocks
        tableView?.reloadData()
    }

    func updateSetting(for block: SettingsBlock) {
        switch block {
        case .radioBlock:
            guard let index = blocks.firstIndex(where: { $0 == block }) else {
                return
            }
            self.blocks[index] = block
            tableView?.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }

}

// MARK: - UITableViewDataSource

extension SettingsAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let block = blocks[safe: indexPath.row] else {
            return UITableViewCell()
        }
        switch block {
        case .radioBlock(let model):
            guard let cell = tableView.dequeueReusableCell(RadioButtonCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension SettingsAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let block = blocks[safe: indexPath.row] else {
            return
        }
        switch block {
        case .radioBlock:
            onToggleRadioSetting?(block)
        }
    }

}
