//
//  CollectionCellsChapter.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

@available(iOS 13.0, *)
final class CollectionCellsChapter {

    func build() -> PlaybookChapter {
        let chapter = PlaybookChapter(name: "CollectionCells", pages: [])
        chapter
            .add(page: dishCell)
        return chapter
    }

}
