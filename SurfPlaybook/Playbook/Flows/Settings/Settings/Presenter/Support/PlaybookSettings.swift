//
//  PlaybookSettings.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

enum PlaybookSettings: String {
    case coloredBackground = "coloredBackground"

    private var name: String {
        switch self {
        case .coloredBackground:
            return L10n.Settings.ColoredBackground.name
        }
    }

    static func setting(by block: SettingsBlock) -> PlaybookSettings? {
        switch block {
        case .radioBlock(let model):
            return PlaybookSettings(rawValue: model.id)
        }
    }

    func block(with storage: PlaybookStorageInterface) -> SettingsBlock {
        switch self {
        case .coloredBackground:
            return .radioBlock(model: .init(id: self.rawValue,
                                            title: self.name,
                                            isSelected: storage.isColoredBackground))
        }
    }

    func toggle(with storage: PlaybookStorageInterface) {
        switch self {
        case .coloredBackground:
            storage.isColoredBackground.toggle()
        }
    }

}
