//
//  ControlsChapter.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 27.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

final class ControlsChapter {

    func build() -> PlaybookChapter {
        let chapter = PlaybookChapter(name: "Controls", pages: [])
        chapter
            .add(page: textField)
            .add(page: commonButton)

        if #available(iOS 15, *) {
            chapter
                .add(page: horizontalPinView)
                .add(page: verticalPinView)
        }

        return chapter
    }

}

// MARK: - Pages

private extension ControlsChapter {

    var commonButton: PlaybookPage {
        return PlaybookPage(name: "CommonButton", description: nil) { _ in
            let button = CommonButton()
            button.setTitle(L10n.Auth.Button.title, for: .normal)
            button.apply(style: .main)
            let container = ViewContainer(button, width: Constants.width, height: 40)
            return container
        }
    }

}
