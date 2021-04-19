//
//  UIKitPageAdapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitPageAdapter {

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var viewModel: UIKitPageViewModel?

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
    }

    // MARK: - Methods

    func configure(with viewModel: UIKitPageViewModel) {
        guard let tableView = tableView else {
            return
        }
        self.viewModel = viewModel
        viewModel.setup(with: tableView)
    }

}
