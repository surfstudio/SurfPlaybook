//
//  TabBarModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TabBarModuleConfigurator {

    func configure() -> (UIViewController, TabBarModuleOutput) {
        let view = TabBarViewController()
        let presenter = TabBarPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
