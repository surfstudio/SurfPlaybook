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
            ("Первая секция", [
                .init(title: "Первый item", subtitle: "описание", showArrow: true),
                .init(title: "Второй item", subtitle: "описание", showArrow: true),
                .init(title: "Третий item", subtitle: "описание", showArrow: true),
                .init(title: "Четвертый item", subtitle: nil, showArrow: true),
                .init(title: "Пятый item", subtitle: nil, showArrow: true)
            ]),
            ("Вторая секция", [
                .init(title: "Первый item", subtitle: nil, showArrow: false),
                .init(title: "Второй item", subtitle: nil, showArrow: false),
                .init(title: "Третий item", subtitle: nil, showArrow: false),
                .init(title: "Четвертый item", subtitle: "Описание", showArrow: false),
                .init(title: "Пятый item", subtitle: "Описание", showArrow: false)
            ])
        ]
    }

}
