//
//  ListModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 26/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ListModuleConfigurator {

    func configure() -> (UIViewController, ListModuleOutput) {
        let view = ListViewController()
        let presenter = ListPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
