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
        static let titleFont = UIFont.systemFont(ofSize: 10, weight: .medium)
    }

    // MARK: - Methods

    func configure() -> TabBarModuleComponents {
        let view = UIViewController.instantiate(ofType: TabBarViewController.self)
        let presenter = TabBarPresenter()

        presenter.view = view
        view.output = presenter

        configureAppearance(for: view)
        view.viewControllers = configureControllers()

        return (view, presenter, presenter)
    }

}

// MARK: - Private Methods

private extension TabBarModuleConfigurator {

    func configureAppearance(for tabBarController: UITabBarController) {
        let backgroundImage = UIImage(color: Colors.TabBar.background)
        let shadowImage = UIImage(color: Colors.TabBar.separator,
                                  size: CGSize(width: 1,
                                               height: 1.0 / UIScreen.main.scale))

        let normalTitleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: Constants.titleFont,
            NSAttributedString.Key.foregroundColor: Colors.TabBar.itemTint
        ]
        let selectedTitleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: Constants.titleFont,
            NSAttributedString.Key.foregroundColor: Colors.TabBar.selectedItemTint
        ]

        if #available(iOS 13, *) {
            let appearance = tabBarController.tabBar.standardAppearance.copy()
            appearance.backgroundImage = backgroundImage
            appearance.shadowImage = shadowImage
            appearance.stackedLayoutAppearance.normal.iconColor = Colors.TabBar.itemTint
            appearance.stackedLayoutAppearance.selected.iconColor = Colors.TabBar.selectedItemTint
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalTitleAttributes
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedTitleAttributes
            tabBarController.tabBar.standardAppearance = appearance
        } else {
            tabBarController.tabBar.backgroundImage = backgroundImage
            tabBarController.tabBar.shadowImage = shadowImage
            tabBarController.tabBar.tintColor = Colors.TabBar.selectedItemTint
            tabBarController.tabBar.unselectedItemTintColor = Colors.TabBar.itemTint
            UITabBarItem.appearance().setTitleTextAttributes(normalTitleAttributes, for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes(selectedTitleAttributes, for: .selected)
        }
    }

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
