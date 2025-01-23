//
//  TextFormatter.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

public protocol TextFormatter {
    /// - parameter text: Исходный текст.
    /// - returns: Отформатированный текст.
    func format(text: String) -> String
}

// MARK: - Implementations

struct DigitsTextFormatter: TextFormatter {

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return text.digits
    }

}

struct PrefixTextFormatter: TextFormatter {

    // MARK: - Private properties

    private let maxLength: Int

    // MARK: - Init

    init(maxLength: Int) {
        self.maxLength = maxLength
    }

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return String(text.prefix(maxLength))
    }

}

/// Форматтер последовательно выполнит форматтирование вложенными форматтерами.
/// - Note: Порядок добавления форматтеров важен.
struct CombinedTextFormatter: TextFormatter {

    // MARK: - Properties

    let formatters: [TextFormatter]

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return formatters.reduce(text) { $1.format(text: $0) }
    }
}

// MARK: - Array support

extension Array where Element == any TextFormatter {

    var combined: TextFormatter {
        CombinedTextFormatter(formatters: self)
    }

}
