//
//  Colors.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

enum Colors {
    enum Main {
        static let active = Resources.Colors.Main.active.color
        static let separator = Resources.Colors.Main.separator.color
        static let background = Resources.Colors.Main.background.color
        static let pressedBackground = Resources.Colors.Main.pressedBackground.color
    }
    enum Text {
        static let main = Resources.Colors.Text.main.color
        static let second = Resources.Colors.Text.second.color
    }
    enum Buttons {
        static let background = Resources.Colors.Buttons.background.color
        static let text = Resources.Colors.Buttons.text.color
    }
    enum NavigationBar {
        public static let text = Resources.Colors.Text.main.color
        public static let tint = Resources.Colors.Main.active.color
        public static let background = Resources.Colors.Main.background.color
    }
    enum TextField {
        public static let background = Resources.Colors.Main.background.color
        public static let text = Resources.Colors.Text.main.color
        public static let placeholder = Resources.Colors.Text.second.color
        public static let tint = Resources.Colors.Main.active.color
    }
}
