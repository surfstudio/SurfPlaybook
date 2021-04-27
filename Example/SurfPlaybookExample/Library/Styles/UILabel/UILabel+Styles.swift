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
            return .init(font: UIFont.systemFont(ofSize: 16, weight: .regular),
                         textColor: Colors.Text.main,
                         lineHeight: 20,
                         kern: -0.32)
        case .textRegular13Gray:
            return .init(font: UIFont.systemFont(ofSize: 13, weight: .regular),
                         textColor: Colors.Text.second,
                         lineHeight: 16,
                         kern: -0.08)
        case .displayHeavy20Black:
            return .init(font: UIFont.systemFont(ofSize: 20, weight: .heavy),
                         textColor: Colors.Text.main,
                         lineHeight: 24,
                         kern: 0.38)
        }
    }
}
