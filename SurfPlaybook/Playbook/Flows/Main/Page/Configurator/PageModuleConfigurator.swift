//
//  PageModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias PageModuleComponents = (
    view: UIViewController,
    output: PageModuleOutput,
    input: PageModuleInput & OptionSelectorHandler
)

final class PageModuleConfigurator {

    func configure(with page: PlaybookPage) -> PageModuleComponents {
        let view = UIViewController.instantiate(ofType: PageViewController.self)
        let presenter = PagePresenter(page: page,
                                      storage: PlaybookUserDefaultsService(),
                                      notificationService: PlaybookNotificationService())

        presenter.view = view
        view.output = presenter

        return (view, presenter, presenter)
    }

}
