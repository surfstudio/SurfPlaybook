//
//  UITextField+Styles.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UITextField {

    func apply(style: UITextFieldStyleType) {
        style.apply(for: self)
    }

}

enum UITextFieldStyleType {
    case email
    case password

    func apply(for field: UITextField) {
        switch self {
        case .email:
            field.placeholder = "Email"
            field.keyboardType = .emailAddress
            field.borderStyle = .line
        case .password:
            field.placeholder = "Пароль"
            field.isSecureTextEntry = true
            field.borderStyle = .line
        }
    }
}
