//
//  ColorsUIKitPage.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit
import SurfPlaybook

final class ColorsUIKitPage: PlaybookUIKitPage {

    var id: String {
        return "ColorsUIKitPage"
    }

    var name: String {
        return "Цвета"
    }

    var viewModel: UIKitPageViewModel {
        return ColorsUIKitPageViewModel()
    }

}

final class ColorsUIKitPageViewModel: UIKitPageViewModel {

    // MARK: - Private Properties

    private weak var tableView: UITableView?

    // MARK: - UIKitPageViewModel

    func setup(with tableView: UITableView) {
        self.tableView = tableView
    }

}
