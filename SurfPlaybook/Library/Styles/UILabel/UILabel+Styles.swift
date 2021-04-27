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
            return .init(font: UIFont.systemFont(ofSize: 17, weight: .regular),
                         textColor: Colors.Main.textMain,
                         lineHeight: 22,
                         kern: -0.41,
                         alignment: .center)
        case .textRegular16Black:
            return .init(font: UIFont.systemFont(ofSize: 16, weight: .regular),
                         textColor: Colors.Main.textMain,
                         lineHeight: 20,
                         kern: -0.32)
        case .textRegular14Black:
            return .init(font: UIFont.systemFont(ofSize: 14, weight: .regular),
                         textColor: Colors.Main.textMain,
                         lineHeight: 18,
                         kern: -0.18)
        case .textRegular14GrayCenter:
            return .init(font: UIFont.systemFont(ofSize: 14, weight: .regular),
                         textColor: Colors.Main.gray,
                         lineHeight: 18,
                         kern: -0.18,
                         alignment: .center)
        case .displayRegular21BlackCenter:
            return .init(font: UIFont.systemFont(ofSize: 21, weight: .regular),
                         textColor: Colors.Main.textMain,
                         lineHeight: 28,
                         kern: 0.7,
                         alignment: .center)
        case .displayHeavy24Black:
            return .init(font: UIFont.systemFont(ofSize: 24, weight: .heavy),
                         textColor: Colors.Main.textMain,
                         lineHeight: 28,
                         kern: 0.33)
        }
    }
}
