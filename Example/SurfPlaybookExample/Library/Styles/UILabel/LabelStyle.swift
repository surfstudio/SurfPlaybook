//
//  LabelStyle.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 26.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Общий стиль для всех лейблев приложения
final class LabelStyle {

    // MARK: - Private Properties

    let font: UIFont
    let textColor: UIColor
    let lineHeight: CGFloat
    let kern: CGFloat
    let alignment: NSTextAlignment
    let lineBreakMode: NSLineBreakMode

    // MARK: - Initialization

    init(font: UIFont,
         textColor: UIColor,
         lineHeight: CGFloat,
         kern: CGFloat,
         alignment: NSTextAlignment = .natural,
         lineBreakMode: NSLineBreakMode = .byTruncatingTail) {
        self.font = font
        self.textColor = textColor
        self.lineHeight = lineHeight
        self.kern = kern
        self.alignment = alignment
        self.lineBreakMode = lineBreakMode
    }

    // MARK: - Methods

    func apply(for view: UILabel) {
        let attrs: [StringAttribute] = [
            .lineHeight(lineHeight, font: font),
            .kern(kern),
            .foregroundColor(textColor),
            .aligment(alignment),
            .lineBreakMode(lineBreakMode)
        ]

        view.attributedText = view.text?.with(attributes: attrs)
    }

}
