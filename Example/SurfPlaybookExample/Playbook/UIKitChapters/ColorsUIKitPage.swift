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

final class ColorsUIKitPageViewModel: NSObject, UIKitPageViewModel, UITableViewDataSource {

    // MARK: - Nested Types

    typealias ColorsData = (title: String, color: UIColor, textColor: UIColor?)

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private let colors: [ColorsData] = [
        ("белый", UIColor.white, Colors.Text.second),
        ("черный", UIColor.black, UIColor.white),
        ("розовый", UIColor.systemPink, nil)
    ]

    // MARK: - UIKitPageViewModel

    func setup(with tableView: UITableView) {
        self.tableView = tableView
        tableView.registerNib(UIKitPageCell.self)
        tableView.dataSource = self
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(UIKitPageCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        let colorData = colors[indexPath.row]
        cell.configure(with: .init(text: colorData.title,
                                   textColor: colorData.textColor,
                                   backgroundColor: colorData.color))
        return cell
    }

}
