//
//  OTPFieldPage.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SurfPlaybook
import SwiftUI

@available(iOS 15, *)
extension ControlsChapter {

    var otpField: PlaybookPage {
        var page = PlaybookPage(name: "(OTP) One Time Password Field",
                                description: nil,
                                config: OTPFieldFactory.generate(for: .four))
        page.presets = OTPFieldFactoryPreset.allCases.map { preset in
            (preset: preset, config: OTPFieldFactory.generate(for: preset))
        }
        return page
    }

}

@available(iOS 15, *)
private enum OTPFieldFactoryPreset: UInt, StringRepresentable, CaseIterable {
    case four = 4
    case five
    case six

    var title: String {
        return "\(rawValue)"
    }
}

@available(iOS 15, *)
private enum OTPFieldFactory {

    static func generate(for preset: OTPFieldFactoryPreset) -> (UIViewController?) -> UIView {
        return { controller in
            let container = SUIViewContainer(parent: controller,
                                             width: Constants.cellWidth) {
                OTPField(password: .constant("1111"),
                         hasError: .constant(false),
                         codeLength: preset.rawValue)
            }
            return container
        }
    }

}
