//
//  Colors.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 13.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

public struct ColorsConfig {
    public struct Main {
        public var active: UIColor = Resources.Colors.Main.active.color
        public var background: UIColor = Resources.Colors.Main.background.color
        public var press: UIColor = Resources.Colors.Main.pressedBackground.color
        public var coloredBackground: UIColor = Resources.Colors.Main.coloredBackground.color
        public var translucent: UIColor = Resources.Colors.Main.translucent.color.withAlphaComponent(0.3)
        public var separator: UIColor = Resources.Colors.Main.separator.color
        public var shadow: UIColor = Resources.Colors.Main.shadow.color.withAlphaComponent(0.1)
    }
    public struct Text {
        public var active: UIColor = Resources.Colors.Text.active.color
        public var main: UIColor = Resources.Colors.Text.main.color
        public var second: UIColor = Resources.Colors.Text.second.color
    }
    public struct NavigationBar {
        public var text: UIColor = Resources.Colors.Text.main.color
        public var tint: UIColor = Resources.Colors.Main.active.color
        public var background: UIColor = Resources.Colors.Main.background.color
    }
    public struct TabBar {
        public var itemTint: UIColor = Resources.Colors.TabBar.tint.color
        public var selectedItemTint: UIColor = Resources.Colors.TabBar.selectedTint.color
        public var background: UIColor = Resources.Colors.Main.background.color
        public var separator: UIColor = Resources.Colors.TabBar.tint.color.withAlphaComponent(0.3)
    }
    public struct SearchBar {
        public var container: UIColor = Resources.Colors.TextField.container.color
        public var text: UIColor = Resources.Colors.Text.main.color
        public var placeholder: UIColor = Resources.Colors.Text.second.color
        public var tint: UIColor = Resources.Colors.Main.active.color
    }

    public static var shared = ColorsConfig()

    public var main: Main
    public var text: Text
    public var navigationBar: NavigationBar
    public var tabBar: TabBar
    public var searchBar: SearchBar

    init() {
        self.main = Main()
        self.text = Text()
        self.navigationBar = NavigationBar()
        self.tabBar = TabBar()
        self.searchBar = SearchBar()
    }

}

enum Colors {
    enum Main {
        static var active = ColorsConfig.shared.main.active
        static var background = ColorsConfig.shared.main.background
        static var press = ColorsConfig.shared.main.press
        static var coloredBackground = ColorsConfig.shared.main.coloredBackground
        static var translucent = ColorsConfig.shared.main.translucent
        static var separator = ColorsConfig.shared.main.separator
        static var shadow = ColorsConfig.shared.main.shadow
    }
    enum Text {
        static let active = ColorsConfig.shared.text.active
        static let main = ColorsConfig.shared.text.main
        static let second = ColorsConfig.shared.text.second
    }
    enum NavigationBar {
        public static let text = ColorsConfig.shared.navigationBar.text
        public static let tint = ColorsConfig.shared.navigationBar.tint
        public static let background = ColorsConfig.shared.navigationBar.background
    }
    enum TabBar {
        public static let itemTint = ColorsConfig.shared.tabBar.itemTint
        public static let selectedItemTint = ColorsConfig.shared.tabBar.selectedItemTint
        public static let background = ColorsConfig.shared.tabBar.background
        public static let separator = ColorsConfig.shared.tabBar.separator
    }
    enum SearchBar {
        public static let container = ColorsConfig.shared.searchBar.container
        public static let text = ColorsConfig.shared.searchBar.text
        public static let placeholder = ColorsConfig.shared.searchBar.placeholder
        public static let tint = ColorsConfig.shared.searchBar.tint
    }
}
