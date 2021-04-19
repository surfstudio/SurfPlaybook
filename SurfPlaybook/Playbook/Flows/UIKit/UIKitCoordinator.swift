//
//  UIKitCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class UIKitCoordinator: BaseCoordinator, UIKitCoordinatorOutput {

    // MARK: - UIKitCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showKit()
    }

}

// MARK: - Private Methods

private extension UIKitCoordinator {

    func showKit() {
        let (view, output) = UIKitModuleConfigurator().configure()
        output.onPageOpen = { [weak self] page in
            self?.showKitPage(page: page)
        }
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

    func showKitPage(page: PlaybookUIKitPage) {
        let (view, _) = UIKitPageModuleConfigurator().configure(page: page)
        router.push(view)
    }

}
