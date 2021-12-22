//
//  ColorsConfig.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 28.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/**
 Конфиг со всеми цветами приложения.

 Имеется возможность изменить любой цвет на необходимый

 Изменять цвета необходимо перед вызывом
 ````
 Playbook.shared.start(from: window)
 ````
*/
public enum ColorsConfig {
    public enum Main {
        /// иконка лупы в search-bar + radio-button на экране настроек
        public static var active: UIColor = Resources.Colors.Main.active.color
        /// основной цвет фона
        public static var background: UIColor = Resources.Colors.Main.background.color
        /// цвет фона при нажатии на элемент (например, ячейку)
        public static var press: UIColor = Resources.Colors.Main.pressedBackground.color
        /// цвет фона на экране страницы UI-компонента, когда включена опция `coloredBackground`
        public static var coloredBackground: UIColor = Resources.Colors.Main.coloredBackground.color
        /// цвет полупрохрачного фона на экране выбора preset-а
        public static var translucent: UIColor = Resources.Colors.Main.translucent.color.withAlphaComponent(0.3)
        /// цвет сепараторов в ячейке
        public static var separator: UIColor = Resources.Colors.Main.separator.color
        /// цвет тени для ячеек в карусели на главном экране
        public static var shadow: UIColor = Resources.Colors.Main.shadow.color.withAlphaComponent(0.1)
    }
    public enum Text {
        /// цвет текста в done-кнопке на экране выбора preset-а
        /// и cancel-кнопке search-bar-а
        public static var active: UIColor = Resources.Colors.Text.active.color
        /// основной цвет текста
        public static var main: UIColor = Resources.Colors.Text.main.color
        /// вспомогательный цвет текста (cancel-кнопка экрана выбора preset-а, empty-лейблы)
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
