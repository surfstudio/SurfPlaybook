//
//  IconButtonStyle.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Стиль для кнопок с одной лишь иконкой
final class IconButtonStyle: AbstractButtonStyle {

    // MARK: - Private Properties

    private let icon: UIImage
    private let pressedIcon: UIImage?
    private let cornerRadius: CGFloat?
    private let tintColor: UIColor?
    private let borderColor: CGColor?
    private let borderWidth: CGFloat?
    private let disabledColor: UIColor?

    // MARK: - Initialization

    init(icon: UIImage,
         pressedIcon: UIImage? = nil,
         cornerRadius: CGFloat? = nil,
         tintColor: UIColor? = nil,
         borderColor: CGColor? = nil,
         borderWidth: CGFloat? = nil,
         disabledColor: UIColor? = nil) {
        self.icon = icon
        self.pressedIcon = pressedIcon
        self.cornerRadius = cornerRadius
        self.tintColor = tintColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.disabledColor = disabledColor
    }

    // MARK: - AbstractButtonStyle

    func apply(for view: CommonButton) {
        let image: UIImage
        if let tintColor = tintColor {
            view.tintColor = tintColor
            image = icon.withRenderingMode(.alwaysTemplate)
        } else {
            image = icon.withRenderingMode(.alwaysOriginal)
        }

        view.setTitle("", for: .normal)
        view.setImage(image, for: .normal)
        view.setImage(image.mask(with: 0.5), for: .highlighted)

        if let pressedImage = pressedIcon {
            view.setImage(pressedImage, for: .selected)
            view.setImage(pressedImage.mask(with: 0.5), for: [.selected, .highlighted])
        } else {
            view.setImage(image.mask(with: 0.5), for: .selected)
        }

        if let color = disabledColor {
            view.setImage(image.mask(with: color), for: .disabled)
        }

        view.layer.cornerRadius = cornerRadius ?? 0
        view.layer.masksToBounds = true

        if let borderColor = borderColor, let borderWidth = borderWidth {
            view.layer.borderColor = borderColor
            view.layer.borderWidth = borderWidth
        }
    }

}
