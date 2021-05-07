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
        return L10n.List.title
    }

    var type: FlowCoordinatorType {
        return .coordinator { [weak self] in
            let (view, _) = ListModuleConfigurator().configure()
            self?.router.push(view)
        }
    }

}
