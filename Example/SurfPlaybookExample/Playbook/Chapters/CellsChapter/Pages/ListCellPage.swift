//
//  ListCellPage.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 27.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

extension CellsChapter {

    var listCell: PlaybookPage {
        var page = PlaybookPage(name: "ListTableViewCell",
                                description: nil,
                                config: ListCellFactory().generate(for: .title))
        page.presets = [
            (ListCellFactoryPreset.title, ListCellFactory().generate(for: .title)),
            (ListCellFactoryPreset.titleAndArrow, ListCellFactory().generate(for: .titleAndArrow)),
            (ListCellFactoryPreset.full, ListCellFactory().generate(for: .full)),
            (ListCellFactoryPreset.fullAndArrow, ListCellFactory().generate(for: .fullAndArrow))
        ]
        return page
    }

}

private enum ListCellFactoryPreset: OptionSelectorModel {
    case title
    case titleAndArrow
    case full
    case fullAndArrow

    var title: String {
        switch self {
        case .title:
            return "Заголовок"
        case .titleAndArrow:
            return "Заголовок со стрелкой"
        case .full:
            return "Полный вид"
        case .fullAndArrow:
            return "Полный вид и стрелка"
        }
    }
}

private final class ListCellFactory {

    func generate(for preset: ListCellFactoryPreset) -> (() -> UIView) {
        return { () -> UIView in
            let container = TableViewCellSnapshotContainer<ListTableViewCell>(width: Constants.cellWidth) { (cell, _) in
                switch preset {
                case .title:
                    cell.configure(with: .init(title: "Заголовок", subtitle: nil, showArrow: false))
                case .titleAndArrow:
                    cell.configure(with: .init(title: "Заголовок", subtitle: nil, showArrow: true))
                case .full:
                    cell.configure(with: .init(title: "Заголовок", subtitle: "Подзаголовок", showArrow: false))
                case .fullAndArrow:
                    cell.configure(with: .init(title: "Заголовок", subtitle: "Подзаголовок", showArrow: true))
                }
            }
            return container
        }
    }

}
