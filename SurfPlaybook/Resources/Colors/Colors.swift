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
        static let active = Resources.Colors.Main.active.color
        static let background = Resources.Colors.Main.background.color
        static let press = Resources.Colors.Main.pressedBackground.color
        static let coloredBackground = Resources.Colors.Main.coloredBackground.color
        static let translucent = Resources.Colors.Main.translucent.color.withAlphaComponent(0.3)
        static let separator = Resources.Colors.Main.separator.color
        static let shadow = Resources.Colors.Main.shadow.color.withAlphaComponent(0.1)
    }
    enum Text {
        static let active = Resources.Colors.Text.active.color
        static let main = Resources.Colors.Text.main.color
        static let second = Resources.Colors.Text.second.color
    }
    enum NavigationBar {
        public static let text = Resources.Colors.Text.main.color
        public static let tint = Resources.Colors.Main.active.color
        public static let background = Resources.Colors.Main.background.color
    }
    enum TabBar {
        public static let itemTint = Resources.Colors.TabBar.tint.color
        public static let selectedItemTint = Resources.Colors.TabBar.selectedTint.color
        public static let background = Resources.Colors.Main.background.color
        public static let separator = Resources.Colors.TabBar.tint.color.withAlphaComponent(0.3)
    }
    enum TextField {
        public static let background = Resources.Colors.Main.background.color
        public static let container = Resources.Colors.TextField.container.color
        public static let text = Resources.Colors.Text.main.color
        public static let placeholder = Resources.Colors.Text.second.color
        public static let button = Resources.Colors.Main.active.color
        public static let tint = Resources.Colors.Main.active.color
    }
}
