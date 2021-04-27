//
//  CommonButton+Styles.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension CommonButton {

    func apply(style: CommonButtonStyleType) {
        style.style.apply(for: self)
    }

}

enum CommonButtonStyleType {
    case main

    var style: CommonButtonStyle {
        switch self {
        case .main:
            return CommonButtonStyle(titleFont: UIFont.systemFont(ofSize: 17, weight: .medium),
                                     titleColor: Colors.Buttons.text,
                                     highlightedTitleColor: Colors.Buttons.text,
                                     backgroundColor: Colors.Buttons.background,
                                     highlightedBackgroundColor: Colors.Buttons.background.withAlphaComponent(0.5),
                                     contentInsets: .init(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
}
