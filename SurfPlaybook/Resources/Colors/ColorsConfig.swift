//
//  ColorsConfig.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 28.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

public enum ColorsConfig {
    public enum Main {
        public static var active: UIColor = Resources.Colors.Main.active.color
        public static var background: UIColor = Resources.Colors.Main.background.color
        public static var press: UIColor = Resources.Colors.Main.pressedBackground.color
        public static var coloredBackground: UIColor = Resources.Colors.Main.coloredBackground.color
        public static var translucent: UIColor = Resources.Colors.Main.translucent.color.withAlphaComponent(0.3)
        public static var separator: UIColor = Resources.Colors.Main.separator.color
        public static var shadow: UIColor = Resources.Colors.Main.shadow.color.withAlphaComponent(0.1)
    }
    public enum Text {
        public static var active: UIColor = Resources.Colors.Text.active.color
        public static var main: UIColor = Resources.Colors.Text.main.color
        public static var second: UIColor = Resources.Colors.Text.second.color
    }
    public enum NavigationBar {
        public static var text: UIColor = Resources.Colors.Text.main.color
        public static var tint: UIColor = Resources.Colors.Main.active.color
        public static var background: UIColor = Resources.Colors.Main.background.color
    }
    public enum TabBar {
        public static var itemTint: UIColor = Resources.Colors.TabBar.tint.color
        public static var selectedItemTint: UIColor = Resources.Colors.TabBar.selectedTint.color
        public static var background: UIColor = Resources.Colors.Main.background.color
        public static var separator: UIColor = Resources.Colors.TabBar.tint.color.withAlphaComponent(0.3)
    }
    public enum SearchBar {
        public static var container: UIColor = Resources.Colors.TextField.container.color
        public static var text: UIColor = Resources.Colors.Text.main.color
        public static var placeholder: UIColor = Resources.Colors.Text.second.color
        public static var tint: UIColor = Resources.Colors.Main.active.color
    }
}
