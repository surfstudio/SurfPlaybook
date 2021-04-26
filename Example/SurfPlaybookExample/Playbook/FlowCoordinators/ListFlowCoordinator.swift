//
//  ListFlowCoordinator.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 26.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook

final class ListFlowCoordinator: PlaybookFlowCoordinator {

    // MARK: - Private Properties

    private let router = MainRouter()

    // MARK: - PlaybookFlowCoordinator

    var id: String {
        return "ListFlowCoordinator"
    }

    var name: String {
        return "Список"
    }

    func start() {
        let (view, _) = ListModuleConfigurator().configure()
        router.push(view)
    }

}
