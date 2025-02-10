//
//  TabBarViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // MARK: - Constants

    private enum Constants {
        static let titleFont = UIFont.systemFont(ofSize: 10, weight: .medium)
    }

    // MARK: - Properties

    var output: TabBarViewOutput?

    // MARK: - Private Properties

    private var isSelectableStackEmpty = true

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureAppearance()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureAppearance()
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

    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        let navigationController = viewController as? UINavigationController
        var isStackEmpty = true
        if let isEmpty = navigationController?.viewControllers.isEmpty, !isEmpty {
            isStackEmpty = navigationController?.visibleViewController == navigationController?.viewControllers[0]
        }
        isSelectableStackEmpty = isStackEmpty

        // Отключаем новомодную [анимацию](https://medium.com/@adityaramadhan.biz/new-tabbar-transition-animation-in-ios-18-and-xcode-16-ea4b2c4d84d4)
        guard let fromView = selectedViewController?.view,
              let toView = viewController.view else {
            return false
        }

        if fromView != toView {
            UIView.transition(from: fromView,
                              to: toView,
                              duration: 0,
                              options: [.transitionCrossDissolve],
                              completion: nil)
        }

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

// MARK: - Appearance

private extension TabBarViewController {

    func configureAppearance() {
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
            let appearance = tabBar.standardAppearance.copy()
            appearance.backgroundImage = backgroundImage
            appearance.shadowImage = shadowImage
            appearance.stackedLayoutAppearance.normal.iconColor = Colors.TabBar.itemTint
            appearance.stackedLayoutAppearance.selected.iconColor = Colors.TabBar.selectedItemTint
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalTitleAttributes
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedTitleAttributes
            tabBar.standardAppearance = appearance
            if #available(iOS 15, *) {
                tabBar.scrollEdgeAppearance = appearance
            }
        } else {
            tabBar.backgroundImage = backgroundImage
            tabBar.shadowImage = shadowImage
            tabBar.tintColor = Colors.TabBar.selectedItemTint
            tabBar.unselectedItemTintColor = Colors.TabBar.itemTint
            UITabBarItem.appearance().setTitleTextAttributes(normalTitleAttributes, for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes(selectedTitleAttributes, for: .selected)
        }
    }

}
