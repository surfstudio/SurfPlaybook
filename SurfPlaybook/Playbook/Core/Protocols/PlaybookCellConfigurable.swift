//
//  CellConfigurable.swift
//  SurfPlaybook
//
//  Created by Дмитрий Йорданов on 20.01.2023.
//  Copyright © 2023 Surf. All rights reserved.
//

import UIKit

/// В случае, если ячейка находится в SPM-пакете,
/// необходимо подписать ее под протокол и указать Bundle.module
public protocol PlaybookCellConfigurable where Self: UITableViewCell {
    static func cellBundle() -> Bundle?
}

public extension PlaybookCellConfigurable {

    static func cellBundle() -> Bundle? {
        return nil
    }

}
