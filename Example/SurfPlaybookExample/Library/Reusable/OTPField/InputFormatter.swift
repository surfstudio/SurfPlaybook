//
//  InputFormatter.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import Combine
import SwiftUI

/// Модификатор для форматирования ввода в поле ввода
@available(iOS 13, *)
struct InputFormatterModifier: ViewModifier {
    @Binding var input: String

    var formatter: TextFormatter

    func body(content: Content) -> some View {
        content
            .onReceive(Just(input)) { newValue in
                self.input = formatter.format(text: newValue)
            }
    }
}

// MARK: - Accessor

@available(iOS 13, *)
public extension View {

    /// Модификатор для форматирования ввода в поле ввода
    func formatInput(_ input: Binding<String>, with formatter: TextFormatter) -> some View {
        return modifier(InputFormatterModifier(input: input, formatter: formatter))
    }

}
