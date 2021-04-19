//
//  UIKitAdapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitAdapter: NSObject {

    // MARK: - Properties

    var onPageSelect: Closure<String>?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var pages: [PlaybookUIKitPage] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(MenuItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Methods

    func update(with pages: [PlaybookUIKitPage]) {
        self.pages = pages
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension UIKitAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let page = pages[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(MenuItemCell.self, indexPath: indexPath)
        else {
            return UITableViewCell()
        }
        cell.configure(with: .init(text: page.name))
        return cell
    }

}

// MARK: - UITableViewDelegate

extension UIKitAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let page = pages[safe: indexPath.row] else {
            return
        }
        onPageSelect?(page.id)
    }

}
