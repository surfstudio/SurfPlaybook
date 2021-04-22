//
//  UILabel+Styles.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UILabel {

    func apply(style: LabelStyleType) {
        style.style.apply(for: self)
    }

}

enum LabelStyleType {
    case textRegular17BlackCenter
    case textRegular16Black
    case textRegular14Black
    case textRegular14GrayCenter
    case displayRegular21BlackCenter
    case displayHeavy24Black

    var style: LabelStyle {
        switch self {
        case .textRegular17BlackCenter:
            return .init(font: FontFamily.SFProText.regular.font(size: 17),
                         textColor: Colors.Main.textMain,
                         lineHeight: 22,
                         kern: -0.41)
        case .textRegular16Black:
            return .init(font: FontFamily.SFProText.regular.font(size: 16),
                         textColor: Colors.Main.textMain,
                         lineHeight: 20,
                         kern: -0.32)
        case .textRegular14Black:
            return .init(font: FontFamily.SFProText.regular.font(size: 14),
                         textColor: Colors.Main.textMain,
                         lineHeight: 18,
                         kern: -0.18)
        case .textRegular14GrayCenter:
            return .init(font: FontFamily.SFProText.regular.font(size: 14),
                         textColor: Colors.Main.gray,
                         lineHeight: 18,
                         kern: -0.18,
                         alignment: .center)
        case .displayRegular21BlackCenter:
            return .init(font: FontFamily.SFProDisplay.regular.font(size: 21),
                         textColor: Colors.Main.textMain,
                         lineHeight: 28,
                         kern: 0.7)
        case .displayHeavy24Black:
            return .init(font: FontFamily.SFProDisplay.heavy.font(size: 24),
                         textColor: Colors.Main.textMain,
                         lineHeight: 28,
                         kern: 0.33)
        }
    }
}
