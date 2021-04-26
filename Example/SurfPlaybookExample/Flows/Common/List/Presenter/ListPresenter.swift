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
        view?.setupInitialState()
    }

}
