//
//  MainCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {

    // MARK: - MainCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showPlaybook()
    }

}

// MARK: - Private Methods

private extension MainCoordinator {

    func showPlaybook() {
        let (view, _) = MainModuleConfigurator().configure()
//        output.onPageShow = { [weak self] page in
//            self?.showPlaybookPage(page)
//        }
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
