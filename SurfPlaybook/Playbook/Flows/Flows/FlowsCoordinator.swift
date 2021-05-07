//
//  FlowsCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class FlowsCoordinator: BaseCoordinator, FlowsCoordinatorOutput {

    // MARK: - FlowsCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showFlows(coordinators: Playbook.shared.flowCoordinators,
                  asRoot: true)
    }

}

// MARK: - Private Methods

private extension FlowsCoordinator {

    func showFlows(coordinators: [PlaybookFlowCoordinator], asRoot: Bool) {
        let (view, output) = FlowsModuleConfigurator().configure(coordinators: coordinators)
        output.onFlowsShow = { [weak self] coordinators in
            self?.showFlows(coordinators: coordinators, asRoot: false)
        }
        if asRoot {
            router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
        } else {
            router.push(view)
        }
    }

}
