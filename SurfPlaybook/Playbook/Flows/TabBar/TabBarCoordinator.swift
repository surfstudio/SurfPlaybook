//
//  TabBarCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class TabBarCoordinator: BaseCoordinator, TabBarCoordinatorOutput {

    // MARK: - TabBarCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showModule()
    }

}

// MARK: - Private Methods

private extension TabBarCoordinator {

    func showModule() {
    }

}
