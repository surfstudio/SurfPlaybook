// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Common {
    internal enum Titles {
      /// Отмена
      internal static let cancel = L10n.tr("Localizable", "Common.Titles.cancel")
      /// Готово
      internal static let done = L10n.tr("Localizable", "Common.Titles.done")
    }
  }

  internal enum Main {
    internal enum EmptySearch {
      /// Ничего не найдено :(
      internal static let message = L10n.tr("Localizable", "Main.EmptySearch.message")
    }
    internal enum EmptyState {
      /// Здесь еще ничего нет :(
      internal static let message = L10n.tr("Localizable", "Main.EmptyState.message")
    }
    internal enum SearchBar {
      /// Поиск
      internal static let placeholder = L10n.tr("Localizable", "Main.SearchBar.placeholder")
    }
  }

  internal enum Settings {
    internal enum ColoredBackground {
      /// Цветной бэкграунд
      internal static let name = L10n.tr("Localizable", "Settings.ColoredBackground.name")
    }
  }

  internal enum TabBar {
    internal enum Flows {
      /// Flows
      internal static let title = L10n.tr("Localizable", "TabBar.Flows.title")
    }
    internal enum Main {
      /// Playbook
      internal static let title = L10n.tr("Localizable", "TabBar.Main.title")
    }
    internal enum Settings {
      /// Настройки
      internal static let title = L10n.tr("Localizable", "TabBar.Settings.title")
    }
    internal enum UIKit {
      /// UIKit
      internal static let title = L10n.tr("Localizable", "TabBar.UIKit.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
