//
//  UITableView.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UITableView {

    // MARK: - Methods

    func registerNib(_ cellType: UITableViewCell.Type) {
        self.register(UINib(nibName: cellType.className,
                            bundle: Bundle(for: cellType.self)),
                      forCellReuseIdentifier: cellType.className)
    }

    /// Позволяет подскроллить таблицу к первой ячейке
    func scrollToFirstRow(animated: Bool = true) {
        // проверка для предотвращения краша при отсутствии в таблице секций/контента
        guard
            numberOfSections > 0,
            numberOfRows(inSection: 0) > 0
        else {
            setContentOffset(.zero, animated: true)
            return
        }
        scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: animated)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(_ type: Cell.Type = Cell.self, indexPath: IndexPath) -> Cell? {
        return dequeueReusableCell(withIdentifier: Cell.identifier(), for: indexPath) as? Cell
    }

}
