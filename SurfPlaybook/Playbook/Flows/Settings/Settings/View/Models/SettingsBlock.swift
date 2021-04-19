//
//  SettingsBlock.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

enum SettingsBlock: Equatable {
    case radioBlock(model: RadioButtonCellModel)

    // MARK: - Equatable

    static func == (lhs: SettingsBlock, rhs: SettingsBlock) -> Bool {
        switch (lhs, rhs) {
        case (.radioBlock(let model1), .radioBlock(let model2)):
            return model1.id == model2.id
        }
    }
}
