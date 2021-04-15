//
//  MainModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class MainModuleConfigurator {

    func configure() -> (UIViewController, MainModuleOutput) {
        let view = UIViewController.instantiate(ofType: MainViewController.self)
        let presenter = MainPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
