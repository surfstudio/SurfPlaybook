// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Auth {
    /// Авторизация
    internal static let title = L10n.tr("Localizable", "Auth.title")
    internal enum Button {
      /// Далее
      internal static let title = L10n.tr("Localizable", "Auth.Button.title")
    }
  }

  internal enum ColorsPage {
    /// черный
    internal static let black = L10n.tr("Localizable", "ColorsPage.black")
    /// розовый
    internal static let pink = L10n.tr("Localizable", "ColorsPage.pink")
    /// Цвета
    internal static let title = L10n.tr("Localizable", "ColorsPage.title")
    /// белый
    internal static let white = L10n.tr("Localizable", "ColorsPage.white")
  }

  internal enum List {
    /// описание
    internal static let subtitle = L10n.tr("Localizable", "List.subtitle")
    /// Список
    internal static let title = L10n.tr("Localizable", "List.title")
    internal enum Item {
      /// Пятый пункт
      internal static let fifth = L10n.tr("Localizable", "List.Item.fifth")
      /// Первый пункт
      internal static let first = L10n.tr("Localizable", "List.Item.first")
      /// Четвертый пункт
      internal static let fourth = L10n.tr("Localizable", "List.Item.fourth")
      /// Второй пункт
      internal static let second = L10n.tr("Localizable", "List.Item.second")
      /// Третий пункт
      internal static let third = L10n.tr("Localizable", "List.Item.third")
    }
    internal enum Section {
      /// Первая секция
      internal static let first = L10n.tr("Localizable", "List.Section.first")
      /// Вторая секция
      internal static let second = L10n.tr("Localizable", "List.Section.second")
    }
  }

  internal enum ListCellPreset {
    internal enum Content {
      /// Подзаголовок
      internal static let subtitle = L10n.tr("Localizable", "ListCellPreset.Content.subtitle")
      /// Заголовок
      internal static let title = L10n.tr("Localizable", "ListCellPreset.Content.title")
    }
    internal enum Full {
      /// Полный вид
      internal static let name = L10n.tr("Localizable", "ListCellPreset.Full.name")
    }
    internal enum FullAndArrow {
      /// Полный вид и стрелка
      internal static let name = L10n.tr("Localizable", "ListCellPreset.FullAndArrow.name")
    }
    internal enum Title {
      /// Заголовок
      internal static let name = L10n.tr("Localizable", "ListCellPreset.Title.name")
    }
    internal enum TitleAndArrow {
      /// Заголовок со стрелкой
      internal static let name = L10n.tr("Localizable", "ListCellPreset.TitleAndArrow.name")
    }
  }

  internal enum TextField {
    internal enum Email {
      /// Email
      internal static let placeholder = L10n.tr("Localizable", "TextField.Email.placeholder")
    }
    internal enum Password {
      /// Пароль
      internal static let placeholder = L10n.tr("Localizable", "TextField.Password.placeholder")
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
