//
//  SettingsCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {

    // MARK: - SettingsCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showSettings()
    }

}

// MARK: - Private Methods

private extension SettingsCoordinator {

    func showSettings() {
        let (view, _) = SettingsModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
