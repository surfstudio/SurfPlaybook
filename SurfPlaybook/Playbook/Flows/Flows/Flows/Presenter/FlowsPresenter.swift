//
//  FlowsPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class FlowsPresenter: FlowsModuleOutput {

    // MARK: - FlowsModuleOutput

    // MARK: - Properties

    weak var view: FlowsViewInput?

}

// MARK: - FlowsModuleInput

extension FlowsPresenter: FlowsModuleInput {
}

// MARK: - FlowsViewOutput

extension FlowsPresenter: FlowsViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
