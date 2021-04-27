//
//  Colors.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 13.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

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
        public static let text = ColorsConfig.NavigationBar.text
        public static let tint = ColorsConfig.NavigationBar.tint
        public static let background = ColorsConfig.NavigationBar.background
    }
    enum TabBar {
        public static let itemTint = ColorsConfig.TabBar.itemTint
        public static let selectedItemTint = ColorsConfig.TabBar.selectedItemTint
        public static let background = ColorsConfig.TabBar.background
        public static let separator = ColorsConfig.TabBar.separator
    }
    enum SearchBar {
        public static let container = ColorsConfig.SearchBar.container
        public static let text = ColorsConfig.SearchBar.text
        public static let placeholder = ColorsConfig.SearchBar.placeholder
        public static let tint = ColorsConfig.SearchBar.tint
    }
}
