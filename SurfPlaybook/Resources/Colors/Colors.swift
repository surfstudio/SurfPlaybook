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
    }
    enum NavigationBar {
        public static let text = UIColor.black
        public static let tint = UIColor.gray
        public static let background = UIColor.white
    }
    public enum TabBar {
        public static let itemTint = UIColor.gray
        public static let selectedItemTint = UIColor.red
        public static let background = UIColor.white
        public static let separator = UIColor.black.withAlphaComponent(0.06)
    }
}
