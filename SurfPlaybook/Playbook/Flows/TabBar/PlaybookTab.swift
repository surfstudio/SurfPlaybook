//
//  PlaybookTab.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

enum PlaybookTab: Int, CaseIterable {

    case main
    case uiKit
    case flows
    case settings

    // MARK: - Properties

    var image: UIImage {
        switch self {
        case .main:
            return Resources.Assets.TabBar.main.image
        case .uiKit:
            return Resources.Assets.TabBar.uiKit.image
        case .flows:
            return Resources.Assets.TabBar.flows.image
        case .settings:
            return Resources.Assets.TabBar.settings.image
        }
    }

    var selectedImage: UIImage {
        return image
    }

    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .uiKit:
            return "UIKit"
        case .flows:
            return "Flows"
        case .settings:
            return "Настройки"
        }
    }

    var navigationController: UINavigationController {
        return BaseNavigationController()
    }

}
