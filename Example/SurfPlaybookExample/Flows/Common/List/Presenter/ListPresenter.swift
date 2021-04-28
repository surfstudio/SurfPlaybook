//
//  ListPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 26/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class ListPresenter: ListModuleOutput {

    // MARK: - ListModuleOutput

    // MARK: - Properties

    weak var view: ListViewInput?

}

// MARK: - ListModuleInput

extension ListPresenter: ListModuleInput {
}

// MARK: - ListViewOutput

extension ListPresenter: ListViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: generateMockData())
    }

}

// MARK: - Private Methods

private extension ListPresenter {

    func generateMockData() -> [ListAdapter.ListData] {
        return [
            (L10n.List.Section.first, [
                .init(title: L10n.List.Item.first, subtitle: L10n.List.subtitle, showArrow: true),
                .init(title: L10n.List.Item.second, subtitle: L10n.List.subtitle, showArrow: true),
                .init(title: L10n.List.Item.third, subtitle: L10n.List.subtitle, showArrow: true),
                .init(title: L10n.List.Item.fourth, subtitle: nil, showArrow: true),
                .init(title: L10n.List.Item.fifth, subtitle: nil, showArrow: true)
            ]),
            (L10n.List.Section.second, [
                .init(title: L10n.List.Item.first, subtitle: nil, showArrow: false),
                .init(title: L10n.List.Item.second, subtitle: nil, showArrow: false),
                .init(title: L10n.List.Item.third, subtitle: nil, showArrow: false),
                .init(title: L10n.List.Item.fourth, subtitle: L10n.List.subtitle, showArrow: false),
                .init(title: L10n.List.Item.fifth, subtitle: L10n.List.subtitle, showArrow: false)
            ])
        ]
    }

}
