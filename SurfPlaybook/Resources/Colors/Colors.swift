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
        static let active = UIColor.green
        static let gray = UIColor.gray
        static let transparent = UIColor.clear
        static let separator = UIColor.gray
        static let textMain = UIColor.black
        static let background = UIColor.white
        static let press = UIColor.gray
        static let shadow = UIColor.black.withAlphaComponent(0.1)
    }
    enum NavigationBar {
        public static let text = UIColor.black
        public static let tint = UIColor.gray
        public static let background = UIColor.white
    }
    enum TabBar {
        public static let itemTint = UIColor.gray
        public static let selectedItemTint = UIColor.red
        public static let background = UIColor.white
        public static let separator = UIColor.black.withAlphaComponent(0.06)
    }
    enum TextField {
        public static let background = UIColor.white
        public static let container = UIColor.lightGray
        public static let text = UIColor.black
        public static let placeholder = UIColor.gray
        public static let button = UIColor.green
        public static let tint = UIColor.green
        public static let hint = UIColor.green
    }
}
