//
//  SettingsModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class SettingsModuleConfigurator {

    func configure() -> (UIViewController, SettingsModuleOutput) {
        let view = UIViewController.instantiate(ofType: SettingsViewController.self)
        let presenter = SettingsPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
