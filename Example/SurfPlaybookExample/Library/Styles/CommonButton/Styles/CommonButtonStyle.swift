//
//  CommonButtonStyle.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Общий стиль для кнопки класса CommonButton
final class CommonButtonStyle {

    // MARK: - Private Properties

    private let titleFont: UIFont
    private let titleColor: UIColor
    private let highlightedTitleColor: UIColor
    private let disabledTitleColor: UIColor?
    private let backgroundColor: UIColor
    private let highlightedBackgroundColor: UIColor
    private let disabledBackgroundColor: UIColor?
    private let cornerRadius: CGFloat?
    private let contentInsets: UIEdgeInsets?

    // MARK: - Initialization

    init(titleFont: UIFont,
         titleColor: UIColor,
         highlightedTitleColor: UIColor,
         disabledTitleColor: UIColor? = nil,
         backgroundColor: UIColor,
         highlightedBackgroundColor: UIColor,
         disabledBackgroundColor: UIColor? = nil,
         cornerRadius: CGFloat? = nil,
         contentInsets: UIEdgeInsets? = nil) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.highlightedTitleColor = highlightedTitleColor
        self.disabledTitleColor = disabledTitleColor
        self.backgroundColor = backgroundColor
        self.highlightedBackgroundColor = highlightedBackgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.cornerRadius = cornerRadius
        self.contentInsets = contentInsets
    }

    // MARK: - AbstractButtonStyle

    func apply(for view: CommonButton) {
        view.titleLabel?.font = titleFont
        view.setTitleColor(titleColor, for: .normal)
        view.setTitleColor(highlightedTitleColor, for: .highlighted)
        view.setTitleColor(highlightedTitleColor, for: [.highlighted, .selected])
        if let color = disabledTitleColor {
            view.setTitleColor(color, for: .disabled)
        }

        view.set(backgroundColor: backgroundColor, for: .normal)
        view.set(backgroundColor: highlightedBackgroundColor, for: .highlighted)
        view.setBackgroundImage(UIImage(color: highlightedBackgroundColor), for: [.highlighted, .selected])
        if let color = disabledBackgroundColor {
            view.set(backgroundColor: color, for: .disabled)
        }

        view.layer.cornerRadius = cornerRadius ?? 0
        view.clipsToBounds = true
        if let insets = contentInsets {
            view.contentEdgeInsets = insets
        }
    }

}
