// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Auth {
    /// Localizable.strings
    ///   SurfPlaybook
    /// 
    ///   Created by Александр Чаусов on 15.04.2021.
    ///   Copyright © 2021 Surf. All rights reserved.
    internal static let title = L10n.tr("Localizable", "Auth.title", fallback: "Авторизация")
    internal enum Button {
      /// Далее
      internal static let title = L10n.tr("Localizable", "Auth.Button.title", fallback: "Далее")
    }
  }
  internal enum ColorsPage {
    /// черный
    internal static let black = L10n.tr("Localizable", "ColorsPage.black", fallback: "черный")
    /// розовый
    internal static let pink = L10n.tr("Localizable", "ColorsPage.pink", fallback: "розовый")
    /// Цвета
    internal static let title = L10n.tr("Localizable", "ColorsPage.title", fallback: "Цвета")
    /// белый
    internal static let white = L10n.tr("Localizable", "ColorsPage.white", fallback: "белый")
  }
  internal enum DishCellPreset {
    internal enum Small {
      /// Обычная ячейка блюда
      internal static let `default` = L10n.tr("Localizable", "DishCellPreset.Small.default", fallback: "Обычная ячейка блюда")
      /// Акцентная ячейка новинки
      internal static let new = L10n.tr("Localizable", "DishCellPreset.Small.new", fallback: "Акцентная ячейка новинки")
      internal enum Title {
        /// Новинка
        internal static let new = L10n.tr("Localizable", "DishCellPreset.Small.Title.new", fallback: "Новинка")
      }
    }
  }
  internal enum List {
    /// описание
    internal static let subtitle = L10n.tr("Localizable", "List.subtitle", fallback: "описание")
    /// Список
    internal static let title = L10n.tr("Localizable", "List.title", fallback: "Список")
    internal enum Item {
      /// Пятый пункт
      internal static let fifth = L10n.tr("Localizable", "List.Item.fifth", fallback: "Пятый пункт")
      /// Первый пункт
      internal static let first = L10n.tr("Localizable", "List.Item.first", fallback: "Первый пункт")
      /// Четвертый пункт
      internal static let fourth = L10n.tr("Localizable", "List.Item.fourth", fallback: "Четвертый пункт")
      /// Второй пункт
      internal static let second = L10n.tr("Localizable", "List.Item.second", fallback: "Второй пункт")
      /// Третий пункт
      internal static let third = L10n.tr("Localizable", "List.Item.third", fallback: "Третий пункт")
    }
    internal enum Section {
      /// Первая секция
      internal static let first = L10n.tr("Localizable", "List.Section.first", fallback: "Первая секция")
      /// Вторая секция
      internal static let second = L10n.tr("Localizable", "List.Section.second", fallback: "Вторая секция")
    }
  }
  internal enum ListCellPreset {
    internal enum Content {
      /// Подзаголовок
      internal static let subtitle = L10n.tr("Localizable", "ListCellPreset.Content.subtitle", fallback: "Подзаголовок")
      /// Заголовок
      internal static let title = L10n.tr("Localizable", "ListCellPreset.Content.title", fallback: "Заголовок")
    }
    internal enum Full {
      /// Полный вид
      internal static let name = L10n.tr("Localizable", "ListCellPreset.Full.name", fallback: "Полный вид")
    }
    internal enum FullAndArrow {
      /// Полный вид и стрелка
      internal static let name = L10n.tr("Localizable", "ListCellPreset.FullAndArrow.name", fallback: "Полный вид и стрелка")
    }
    internal enum Title {
      /// Заголовок
      internal static let name = L10n.tr("Localizable", "ListCellPreset.Title.name", fallback: "Заголовок")
    }
    internal enum TitleAndArrow {
      /// Заголовок со стрелкой
      internal static let name = L10n.tr("Localizable", "ListCellPreset.TitleAndArrow.name", fallback: "Заголовок со стрелкой")
    }
  }
  internal enum TextField {
    internal enum Email {
      /// Email
      internal static let placeholder = L10n.tr("Localizable", "TextField.Email.placeholder", fallback: "Email")
    }
    internal enum Password {
      /// Пароль
      internal static let placeholder = L10n.tr("Localizable", "TextField.Password.placeholder", fallback: "Пароль")
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
