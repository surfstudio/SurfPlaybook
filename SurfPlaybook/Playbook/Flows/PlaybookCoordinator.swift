//
//  PlaybookCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class PlaybookCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let router = MainRouter()
    private weak var tabBarCoordinator: TabBarCoordinator?

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        runMainFlow(with: deepLinkOption)
    }
}

// MARK: - Private Methods

private extension PlaybookCoordinator {

    func runMainFlow(with deepLinkOption: DeepLinkOption?) {
        if tabBarCoordinator == nil {
            let coordinator = TabBarCoordinator(router: router)
            tabBarCoordinator = coordinator
            addDependency(coordinator)
        }
        tabBarCoordinator?.start(with: deepLinkOption)
    }

}
