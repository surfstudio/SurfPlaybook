//
//  RoundedOTPFieldStyle.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct RoundedOTPFieldStyle: OTPFieldStyle {

    // MARK: - Properties

    /// Шрифт полей ввода
    let font: SwiftUI.Font
    /// Цвета текста
    let textColors: [TextFieldState: ColorAsset]
    /// Цвета фона
    let backgroundColors: [TextFieldState: ColorAsset]
    /// Горизонтальный отступ текста от фона
    let horizontalPadding: CGFloat
    /// Вертикальный отступ текста от фона
    let verticalPadding: CGFloat
    /// Радиус скругления
    let cornerRadius: CGFloat

    // MARK: - OTPFieldStyle

    public func makeItem(_ field: AnyView, for state: TextFieldState) -> some View {
        field
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .font(font)
            .foregroundColor(textColors.getColor(for: state))
            .background(backgroundColors.getColor(for: state))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

}

@available(iOS 15, *)
public extension OTPFieldStyle where Self == RoundedOTPFieldStyle {

    /// Стиль, где каждый пин пароля имеет фон со скруглениями
    static var rounded: some OTPFieldStyle {
        RoundedOTPFieldStyle(
            font: .body,
            textColors: [
                .normal: Resources.Colors.Text.main,
                .disabled: Resources.Colors.Text.main,
                .error: Resources.Colors.Text.main
            ],
            backgroundColors: [
                .normal: Resources.Colors.Main.background
            ],
            horizontalPadding: 4,
            verticalPadding: 8,
            cornerRadius: 12
        )
    }

}
