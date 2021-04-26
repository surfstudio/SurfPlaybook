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
    case displayHeavy20Black

    var style: LabelStyle {
        switch self {
        case .textRegular16Black:
            return .init(font: FontFamily.SFProText.regular.font(size: 16),
                         textColor: Colors.Text.main,
                         lineHeight: 20,
                         kern: -0.32)
        case .textRegular13Gray:
            return .init(font: FontFamily.SFProText.regular.font(size: 13),
                         textColor: Colors.Text.second,
                         lineHeight: 16,
                         kern: -0.08)
        case .displayHeavy20Black:
            return .init(font: FontFamily.SFProDisplay.heavy.font(size: 20),
                         textColor: Colors.Text.main,
                         lineHeight: 24,
                         kern: 0.38)
        }
    }
}
