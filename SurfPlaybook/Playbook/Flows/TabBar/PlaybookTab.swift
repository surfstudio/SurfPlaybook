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
            return L10n.TabBar.Main.title
        case .uiKit:
            return L10n.TabBar.UIKit.title
        case .flows:
            return L10n.TabBar.Flows.title
        case .settings:
            return L10n.TabBar.Settings.title
        }
    }

    var navigationController: UINavigationController {
        return BaseNavigationController()
    }

}
