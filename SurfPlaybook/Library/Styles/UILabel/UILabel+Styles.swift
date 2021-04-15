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
    case displayRegular21BlackCenter

    var style: LabelStyle {
        switch self {
        case .textRegular17BlackCenter:
            return .init(font: FontFamily.SFProText.regular.font(size: 17),
                         textColor: Colors.Main.textMain,
                         lineHeight: 22,
                         kern: -0.41)
        case .displayRegular21BlackCenter:
            return .init(font: FontFamily.SFProDisplay.regular.font(size: 21),
                         textColor: Colors.Main.textMain,
                         lineHeight: 28,
                         kern: 0.7)
        }
    }
}
