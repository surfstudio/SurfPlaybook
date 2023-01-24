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
public protocol CellConfigurable {
    static func bundle() -> Bundle?
}

extension UITableViewCell: CellConfigurable {

    public static func bundle() -> Bundle? {
        return nil
    }

}
