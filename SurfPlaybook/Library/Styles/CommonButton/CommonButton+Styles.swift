//
//  CommonButton+Styles.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension CommonButton {

    func apply(style: CommonButtonStyleType) {
        style.style.apply(for: self)
    }

}

enum CommonButtonStyleType {
    case textActive
    case textSecond

    case clear

    var style: AbstractButtonStyle {
        switch self {
        case .textActive:
            return CommonButtonStyle(titleFont: UIFont.systemFont(ofSize: 17, weight: .medium),
                                     titleColor: Colors.Text.active,
                                     highlightedTitleColor: Colors.Text.active.withAlphaComponent(0.5),
                                     backgroundColor: .clear,
                                     highlightedBackgroundColor: .clear,
                                     contentInsets: .init(top: 0, left: 16, bottom: 0, right: 16))
        case .textSecond:
            return CommonButtonStyle(titleFont: UIFont.systemFont(ofSize: 17, weight: .regular),
                                     titleColor: Colors.Text.second,
                                     highlightedTitleColor: Colors.Text.second.withAlphaComponent(0.5),
                                     backgroundColor: .clear,
                                     highlightedBackgroundColor: .clear,
                                     contentInsets: .init(top: 0, left: 16, bottom: 0, right: 16))
        case .clear:
            return IconButtonStyle(icon: Resources.Assets.Icons.clear.image)
        }
    }
}
