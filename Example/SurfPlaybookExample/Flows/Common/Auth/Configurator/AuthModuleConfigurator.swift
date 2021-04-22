//
//  AuthModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class AuthModuleConfigurator {

    func configure() -> (UIViewController, AuthModuleOutput) {
        let view = AuthViewController()
        let presenter = AuthPresenter()

        presenter.view = view
        view.output = presenter

        let navigationController = BaseNavigationController(rootViewController: view)
        return (navigationController, presenter)
    }

}
