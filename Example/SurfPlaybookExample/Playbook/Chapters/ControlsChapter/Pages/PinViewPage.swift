//
//  PinViewPage.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SurfPlaybook
import SwiftUI

@available(iOS 15, *)
extension ControlsChapter {

    var horizontalPinView: PlaybookPage {
        var page = PlaybookPage(name: "SUI Horizontal Pins",
                                description: "Горизонтальные анимированные пины",
                                config: HPinViewFactory.generate(for: .four))

        page.presets = PinViewFactoryPreset.allCases.map { preset in
            (preset: preset, config: HPinViewFactory.generate(for: preset))
        }

        return page
    }

    var verticalPinView: PlaybookPage {
        var page = PlaybookPage(name: "SUI Vertical Pins",
                                description: "Вертикальные анимированные пины",
                                config: VPinViewFactory.generate(for: .four))

        page.presets = PinViewFactoryPreset.allCases.map { preset in
            (preset: preset, config: VPinViewFactory.generate(for: preset))
        }

        return page
    }

}

@available(iOS 15, *)
private enum PinViewFactoryPreset: UInt, StringRepresentable, CaseIterable {
    case four = 4
    case five
    case six
    case seven
    case eight

    var title: String {
        return "\(rawValue)"
    }
}

@available(iOS 15, *)
private enum HPinViewFactory {

    static func generate(for preset: PinViewFactoryPreset) -> PlaybookContainerProvider {
        return { controller in
            let container = SUIViewContainer(parent: controller,
                                             width: Constants.cellWidth) {
                HStack(alignment: .center, spacing: 16) {
                    PinView(count: preset.rawValue)
                }
            }
            return container
        }
    }

}

@available(iOS 15, *)
private enum VPinViewFactory {

    static func generate(for preset: PinViewFactoryPreset) -> PlaybookContainerProvider {
        return { controller in
            let container = SUIViewContainer(parent: controller,
                                             width: Constants.cellWidth) {
                VStack(alignment: .center, spacing: 16) {
                    PinView(count: preset.rawValue)
                }
            }
            return container
        }
    }

}
