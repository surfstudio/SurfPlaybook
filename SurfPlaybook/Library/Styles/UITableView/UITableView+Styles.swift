//
//  UITableView+Styles.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UITableView {

    func apply(style: TableViewStyleType) {
        style.apply(for: self)
    }

}

enum TableViewStyleType {
    case `default`

    func apply(for view: UITableView) {
        switch self {
        case .default:
            view.backgroundColor = Colors.Main.background
            view.contentInsetAdjustmentBehavior = .never
            view.keyboardDismissMode = .onDrag
            view.separatorStyle = .none
            // дефолтный отступ снизу до контента, как завещал Гомес
            view.contentInset = .init(top: 0,
                                      left: 0,
                                      bottom: 30,
                                      right: 0)
        }
    }
}
