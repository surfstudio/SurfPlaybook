//
//  PlaybookNotificationType.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

enum PlaybookNotificationType {
    /// вызывается такого типа вызывается при смене настройки "цветной бэкграунд"
    case coloredBackgroundIsChanged

    // MARK: - Properties

    var name: Notification.Name {
        switch self {
        case .coloredBackgroundIsChanged:
            return .coloredBackgroundIsChanged
        }
    }

}

extension Notification.Name {
    private static let prefix = Bundle.main.bundleIdentifier ?? "surf_playbook"

    // MARK: - Keys

    static let coloredBackgroundIsChanged = Notification.Name(prefix + "colored_background_is_changed")
}
