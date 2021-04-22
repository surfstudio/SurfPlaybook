//
//  ViewChapter.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

final class ViewsChapter {

    func build() -> PlaybookChapter {
        let chapter = PlaybookChapter(name: "Views", pages: [])
        chapter
            .add(page: plainLabel)
        return chapter
    }

}

// MARK: - Pages

private extension ViewsChapter {

    var plainLabel: PlaybookPage {
        return PlaybookPage(name: "UILabel", description: nil) { () -> UIView in
            let label = UILabel(frame: .zero)
            label.textColor = .black
            label.textAlignment = .center
            label.text = "Тест"
            let container = ViewSnapshotContainer(label, width: 320, height: nil)
            return container
        }
    }

}
