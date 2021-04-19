//
//  SettingsModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias SettingsModuleComponents = (
    view: UIViewController,
    output: SettingsModuleOutput
)

final class SettingsModuleConfigurator {

    func configure() -> SettingsModuleComponents {
        let view = UIViewController.instantiate(ofType: SettingsViewController.self)
        let presenter = SettingsPresenter(storage: PlaybookUserDefaultsService(),
                                          notificationService: PlaybookNotificationService())

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
