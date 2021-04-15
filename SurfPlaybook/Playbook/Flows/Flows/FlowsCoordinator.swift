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
        showFlows()
    }

}

// MARK: - Private Methods

private extension FlowsCoordinator {

    func showFlows() {
        let (view, _) = FlowsModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
