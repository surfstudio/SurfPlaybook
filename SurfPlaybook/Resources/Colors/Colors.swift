//
//  Colors.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 13.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Цветовая палитра плейбука
///
/// Цвета берутся из ColorsConfig, необходимо соблюдать жесткое соответствие
/// между двумя этими палитрами
enum Colors {
    enum Main {
        static var active = ColorsConfig.Main.active
        static var background = ColorsConfig.Main.background
        static var press = ColorsConfig.Main.press
        static var coloredBackground = ColorsConfig.Main.coloredBackground
        static var translucent = ColorsConfig.Main.translucent
        static var separator = ColorsConfig.Main.separator
        static var shadow = ColorsConfig.Main.shadow
    }
    enum Text {
        static let active = ColorsConfig.Text.active
        static let main = ColorsConfig.Text.main
        static let second = ColorsConfig.Text.second
    }
    enum NavigationBar {
        static let text = ColorsConfig.NavigationBar.text
        static let tint = ColorsConfig.NavigationBar.tint
        static let background = ColorsConfig.NavigationBar.background
    }
    enum TabBar {
        static let itemTint = ColorsConfig.TabBar.itemTint
        static let selectedItemTint = ColorsConfig.TabBar.selectedItemTint
        static let background = ColorsConfig.TabBar.background
        static let separator = ColorsConfig.TabBar.separator
    }
    enum SearchBar {
        static let container = ColorsConfig.SearchBar.container
        static let text = ColorsConfig.SearchBar.text
        static let placeholder = ColorsConfig.SearchBar.placeholder
        static let tint = ColorsConfig.SearchBar.tint
    }
}
