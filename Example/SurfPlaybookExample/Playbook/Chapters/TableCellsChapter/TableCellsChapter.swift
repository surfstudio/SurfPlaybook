//
//  TableCellsChapter.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 27.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

final class TableCellsChapter {

    func build() -> PlaybookChapter {
        let chapter = PlaybookChapter(name: "TableCells", pages: [])
        chapter
            .add(page: listCell)
            .add(page: titleCell)
        return chapter
    }

}

// MARK: - Pages

private extension TableCellsChapter {

    var titleCell: PlaybookPage {
        return PlaybookPage(name: "TitleTableViewCell", description: nil) { _ in
            let container = TableViewCellContainer<TitleTableViewCell>(width: Constants.cellWidth) { (cell, _) in
                cell.configure(with: L10n.ListCellPreset.Content.title)
            }
            return container
        }
    }

}

extension TitleTableViewCell: PlaybookCellConfigurable {}
