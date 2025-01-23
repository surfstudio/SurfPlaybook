//
//  DishCellPage.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SurfPlaybook
import UIKit

@available(iOS 13.0, *)
extension CollectionCellsChapter {

    var dishCell: PlaybookPage {
        var page = PlaybookPage(name: "DishCell",
                                description: "Ячейка блюда",
                                config: DishCellFactory.generate(for: .default)
        )

        page.presets = DishCellFactoryPreset.allCases.map { preset in
            (preset: preset, config: DishCellFactory.generate(for: preset))
        }

        return page
    }

}

private enum DishCellFactoryPreset: StringRepresentable, CaseIterable {
    case `default`
    case new

    var title: String {
        switch self {
        case .default:
            return L10n.DishCellPreset.Small.default
        case .new:
            return L10n.DishCellPreset.Small.new
        }
    }
}

@available(iOS 13.0, *)
private enum DishCellFactory {

    static func generate(for preset: DishCellFactoryPreset) -> ((UIViewController?) -> UIView) {
        return { _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                                  heightDimension: .estimated(224))
            return CollectionViewCellContainer<DishCell>(
                itemSize: itemSize,
                containerHeight: 250,
                registerType: .class,
                configureCell: { (cell, _) in
                    switch preset {
                    case .default:
                        cell.configure(with: .init(name: "Нямка",
                                                   price: "900 ₽",
                                                   image: nil,
                                                   isNew: false)
                        )
                    case .new:
                        cell.configure(with: .init(name: "Нямка",
                                                   price: "400 ₽",
                                                   image: nil,
                                                   isNew: true)
                        )
                    }
            })
        }
    }

}

extension DishCell: PlaybookCellConfigurable { }
