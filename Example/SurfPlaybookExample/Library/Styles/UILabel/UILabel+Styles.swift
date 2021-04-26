//
//  UILabel+Styles.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 26.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UILabel {

    func apply(style: LabelStyleType) {
        style.style.apply(for: self)
    }

}

enum LabelStyleType {
    case textRegular16Black
    case textRegular13Gray
    case displayRegular20Black

    var style: LabelStyle {
        switch self {
        case .textRegular16Black:
            return .init(font: FontFamily.SFProText.regular.font(size: 16),
                         textColor: Colors.Main.textMain,
                         lineHeight: 20,
                         kern: -0.32)
        case .textRegular13Gray:
            return .init(font: FontFamily.SFProText.regular.font(size: 13),
                         textColor: Colors.Main.gray,
                         lineHeight: 16,
                         kern: -0.08)
        case .displayRegular20Black:
            return .init(font: FontFamily.SFProDisplay.regular.font(size: 20),
                         textColor: Colors.Main.textMain,
                         lineHeight: 24,
                         kern: 0.38)
        }
    }
}
