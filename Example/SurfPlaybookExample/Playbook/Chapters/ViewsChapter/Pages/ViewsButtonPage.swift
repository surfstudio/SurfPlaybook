//
//  ViewsButtonPage.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

extension ViewsChapter {

    var plainButton: PlaybookPage {
        var page = PlaybookPage(name: "UIButton",
                                description: nil,
                                config: ButtonFactory().generate(for: .one))
        page.presets = [
            (ButtonFactoryPreset.one, ButtonFactory().generate(for: .one)),
            (ButtonFactoryPreset.two, ButtonFactory().generate(for: .two))
        ]
        return page
    }

}

private enum ButtonFactoryPreset: OptionSelectorModel {
    case one
    case two

    var title: String {
        switch self {
        case .one:
            return "Один"
        case .two:
            return "Два"
        }
    }
}

private final class ButtonFactory {

    func generate(for preset: ButtonFactoryPreset) -> (() -> UIView) {
        return { () -> UIView in
            let button = UIButton()
            switch preset {
            case .one:
                button.setTitle("Один", for: .normal)
                button.setTitleColor(.green, for: .normal)
            case .two:
                button.setTitle("Два", for: .normal)
                button.setTitleColor(.systemPink, for: .normal)
            }
            let container = ViewSnapshotContainer(button, width: 150, height: 40)
            return container
        }
    }

}
