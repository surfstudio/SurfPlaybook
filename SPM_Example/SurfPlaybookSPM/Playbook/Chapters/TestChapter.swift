//
//  TestChapter.swift
//  SurfPlaybookSPM
//
//  Created by Александр Чаусов on 04.05.2021.
//

import SurfPlaybook
import UIKit

final class TestChapter {

    func build() -> PlaybookChapter {
        let chapter = PlaybookChapter(name: "Test", pages: [])
        chapter
            .add(page: label)
        return chapter
    }

}

// MARK: - Pages

private extension TestChapter {

    var label: PlaybookPage {
        return PlaybookPage(name: "UILabel", description: nil) { () -> UIView in
            let label = UILabel()
            label.text = "Test"
            return UILabel()
        }
    }

}
