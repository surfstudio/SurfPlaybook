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
        return chapter
    }

}

// MARK: - Pages

private extension ControlsChapter {

    var commonButton: PlaybookPage {
        return PlaybookPage(name: "CommonButton", description: nil) { () -> UIView in
            let button = CommonButton()
            button.setTitle("Войти", for: .normal)
            button.apply(style: .main)
            let container = ViewSnapshotContainer(button, width: Constants.width, height: 40)
            return container
        }
    }

}
