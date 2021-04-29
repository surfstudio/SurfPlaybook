//
//  StringsConfig.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 28.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

/// Используемые тексты внутри playbook-а
///
/// На данный момент имеется локализация для русского и английского языков
///
/// - Important:
///     Изменять тексты необходимо перед вызывом
///     ~~~
///     Playbook.shared.start(from: window)
///     ~~~
public enum StringsConfig {
    public static var mainTabTitle = L10n.TabBar.Main.title
    public static var uiKitTabTitle = L10n.TabBar.UIKit.title
    public static var flowsTabTitle = L10n.TabBar.Flows.title
    public static var settingsTabTitle = L10n.TabBar.Settings.title

    public static var searchBarPlaceholder = L10n.Main.SearchBar.placeholder
    public static var emptySearchMessage = L10n.Main.EmptySearch.message

    public static var coloredBackgroundName = L10n.Settings.ColoredBackground.name

    public static var cancel = L10n.Common.Titles.cancel
    public static var done = L10n.Common.Titles.done
}
