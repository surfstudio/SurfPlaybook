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

private enum ListCellFactoryPreset: StringRepresentable {
    case title
    case titleAndArrow
    case full
    case fullAndArrow

    var title: String {
        switch self {
        case .title:
            return L10n.ListCellPreset.Title.name
        case .titleAndArrow:
            return L10n.ListCellPreset.TitleAndArrow.name
        case .full:
            return L10n.ListCellPreset.Full.name
        case .fullAndArrow:
            return L10n.ListCellPreset.FullAndArrow.name
        }
    }
}

private final class ListCellFactory {

    func generate(for preset: ListCellFactoryPreset) -> (() -> UIView) {
        return { () -> UIView in
            let container = TableViewCellContainer<ListTableViewCell>(width: Constants.cellWidth) { (cell, _) in
                switch preset {
                case .title:
                    cell.configure(with: .init(title: L10n.ListCellPreset.Content.title,
                                               subtitle: nil,
                                               showArrow: false))
                case .titleAndArrow:
                    cell.configure(with: .init(title: L10n.ListCellPreset.Content.title,
                                               subtitle: nil,
                                               showArrow: true))
                case .full:
                    cell.configure(with: .init(title: L10n.ListCellPreset.Content.title,
                                               subtitle: L10n.ListCellPreset.Content.subtitle,
                                               showArrow: false))
                case .fullAndArrow:
                    cell.configure(with: .init(title: L10n.ListCellPreset.Content.title,
                                               subtitle: L10n.ListCellPreset.Content.subtitle,
                                               showArrow: true))
                }
            }
            return container
        }
    }

}

extension ListTableViewCell: PlaybookCellConfigurable {}
