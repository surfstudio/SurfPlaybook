//
//  TabBarViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // MARK: - Properties

    var output: TabBarViewOutput?

    // MARK: - Private Properties

    private var isSelectableStackEmpty: Bool = true

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

// MARK: - TabBarViewInput

extension TabBarViewController: TabBarViewInput {

    func selectTab(_ tab: PlaybookTab) {
        guard
            let view = viewControllers?[safe: tab.rawValue],
            tabBarController(self, shouldSelect: view) else {
                return
        }
        selectedIndex = tab.rawValue
        tabBarController(self, didSelect: view)
    }

}

// MARK: - UITabBarControllerDelegate

extension TabBarViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let navigationController = viewController as? UINavigationController
        var isStackEmpty = true
        if let isEmpty = navigationController?.viewControllers.isEmpty, !isEmpty {
            isStackEmpty = navigationController?.visibleViewController == navigationController?.viewControllers[0]
        }
        isSelectableStackEmpty = isStackEmpty
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tab = PlaybookTab(rawValue: viewController.tabBarItem.tag) else {
            return
        }
        let navigationController = viewController as? UINavigationController
        let isInitial = navigationController?.viewControllers.isEmpty ?? true
        output?.selectTab(with: tab, isInitial: isInitial, isStackEmpty: isSelectableStackEmpty)
    }

}
