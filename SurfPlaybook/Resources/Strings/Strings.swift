// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Common {
    internal enum Titles {
      /// Отмена
      internal static let cancel = L10n.tr("Localizable", "Common.Titles.cancel", fallback: "Отмена")
      /// Готово
      internal static let done = L10n.tr("Localizable", "Common.Titles.done", fallback: "Готово")
    }
  }
  internal enum Main {
    internal enum EmptySearch {
      /// Ничего не найдено :(
      internal static let message = L10n.tr("Localizable", "Main.EmptySearch.message", fallback: "Ничего не найдено :(")
    }
    internal enum EmptyState {
      /// Здесь еще ничего нет :(
      internal static let message = L10n.tr("Localizable", "Main.EmptyState.message", fallback: "Здесь еще ничего нет :(")
    }
    internal enum SearchBar {
      /// Поиск
      internal static let placeholder = L10n.tr("Localizable", "Main.SearchBar.placeholder", fallback: "Поиск")
    }
    internal enum ShowAll {
      /// Все
      internal static let title = L10n.tr("Localizable", "Main.ShowAll.title", fallback: "Все")
    }
  }
  internal enum Settings {
    internal enum ColoredBackground {
      /// Цветной бэкграунд
      internal static let name = L10n.tr("Localizable", "Settings.ColoredBackground.name", fallback: "Цветной бэкграунд")
    }
  }
  internal enum TabBar {
    internal enum Flows {
      /// Flows
      internal static let title = L10n.tr("Localizable", "TabBar.Flows.title", fallback: "Flows")
    }
    internal enum Main {
      /// Localizable.strings
      ///   SurfPlaybook
      /// 
      ///   Created by Александр Чаусов on 13.04.2021.
      ///   Copyright © 2021 Surf. All rights reserved.
      internal static let title = L10n.tr("Localizable", "TabBar.Main.title", fallback: "Playbook")
    }
    internal enum Settings {
      /// Настройки
      internal static let title = L10n.tr("Localizable", "TabBar.Settings.title", fallback: "Настройки")
    }
    internal enum UIKit {
      /// UIKit
      internal static let title = L10n.tr("Localizable", "TabBar.UIKit.title", fallback: "UIKit")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
