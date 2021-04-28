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
        field.backgroundColor = Colors.TextField.background
        field.textColor = Colors.TextField.text
        field.tintColor = Colors.TextField.tint
        let placeholder: String

        switch self {
        case .email:
            placeholder = L10n.TextField.Email.placeholder
            field.keyboardType = .emailAddress
            field.borderStyle = .roundedRect
        case .password:
            placeholder = L10n.TextField.Password.placeholder
            field.isSecureTextEntry = true
            field.borderStyle = .roundedRect
        }

        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: Colors.TextField.placeholder]
        field.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
