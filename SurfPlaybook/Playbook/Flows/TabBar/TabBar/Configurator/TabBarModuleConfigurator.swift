//
//  TabBarModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias TabBarModuleComponents = (
    view: UIViewController,
    output: TabBarModuleOutput,
    input: TabBarModuleInput
)

final class TabBarModuleConfigurator {

    // MARK: - Constants

    private enum Constants {
        static let tabImageInsets = UIEdgeInsets.zero
    }

    // MARK: - Methods

    func configure() -> TabBarModuleComponents {
        let view = UIViewController.instantiate(ofType: TabBarViewController.self)
        let presenter = TabBarPresenter()

        presenter.view = view
        view.output = presenter
        view.viewControllers = configureControllers()

        return (view, presenter, presenter)
    }

}

// MARK: - Private Methods

private extension TabBarModuleConfigurator {

    func configureControllers() -> [UIViewController] {
        var controllers: [UIViewController] = []
        for tab in PlaybookTab.allCases {
            let tabBarItem = UITabBarItem(title: tab.title,
                                          image: tab.image,
                                          selectedImage: tab.selectedImage)
            tabBarItem.tag = tab.rawValue
            tabBarItem.imageInsets = Constants.tabImageInsets

            let navigationController = tab.navigationController
            navigationController.tabBarItem = tabBarItem
            controllers.append(navigationController)
        }
        return controllers
    }

}
