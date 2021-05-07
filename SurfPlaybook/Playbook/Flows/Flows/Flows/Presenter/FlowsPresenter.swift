//
//  FlowsPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class FlowsPresenter: FlowsModuleOutput {

    // MARK: - FlowsModuleOutput

    var onFlowsShow: Closure<[PlaybookFlowCoordinator]>?

    // MARK: - Properties

    weak var view: FlowsViewInput?

    // MARK: - Private Properties

    private let flowCoordinators: [PlaybookFlowCoordinator]

    // MARK: - Initialization

    init(coordinators: [PlaybookFlowCoordinator]) {
        self.flowCoordinators = coordinators
    }

}

// MARK: - FlowsModuleInput

extension FlowsPresenter: FlowsModuleInput {
}

// MARK: - FlowsViewOutput

extension FlowsPresenter: FlowsViewOutput {

    func viewLoaded() {
        view?.setupInitialState(flowCoordinators: flowCoordinators)
    }

    func selectFlowCoordinator(id: String) {
        guard let coordinator = flowCoordinators.first(where: { $0.id == id }) else {
            return
        }
        switch coordinator.type {
        case .coordinator(let startBlock):
            startBlock()
        case .node(let coordinators):
            onFlowsShow?(coordinators)
        }
    }

}
