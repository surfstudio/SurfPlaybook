//
//  AuthFlowCoordinator.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook

final class AuthFlowCoordinator: PlaybookFlowCoordinator {

    // MARK: - Private Properties

    private let router = MainRouter()

    // MARK: - PlaybookFlowCoordinator

    var id: String {
        return "AuthFlowCoordinator"
    }

    var name: String {
        return L10n.Auth.title
    }

    func start() {
        let (view, output) = AuthModuleConfigurator().configure()
        output.onClose = { [weak self] in
            self?.router.dismissModule()
        }
        router.present(view)
    }

}
