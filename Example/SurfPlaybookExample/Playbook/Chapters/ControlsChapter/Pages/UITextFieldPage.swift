//
//  UITextFieldChapter.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 27.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

extension ControlsChapter {

    var textField: PlaybookPage {
        var page = PlaybookPage(name: "UITextField",
                                description: nil,
                                config: UITextFieldFactory().generate(for: .email))
        page.presets = [
            (UITextFieldFactoryPreset.email, UITextFieldFactory().generate(for: .email)),
            (UITextFieldFactoryPreset.password, UITextFieldFactory().generate(for: .password))
        ]
        return page
    }

}

private enum UITextFieldFactoryPreset: StringRepresentable {
    case email
    case password

    var title: String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Пароль"
        }
    }

    var style: UITextFieldStyleType {
        switch self {
        case .email:
            return .email
        case .password:
            return .password
        }
    }
}

private final class UITextFieldFactory {

    func generate(for preset: UITextFieldFactoryPreset) -> (() -> UIView) {
        return { () -> UIView in
            let textField = UITextField()
            textField.apply(style: preset.style)
            let container = ViewSnapshotContainer(textField, width: Constants.width, height: 40)
            return container
        }
    }

}
