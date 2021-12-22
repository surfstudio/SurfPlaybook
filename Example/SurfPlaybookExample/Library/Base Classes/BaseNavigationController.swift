//
//  BaseNavigationController.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Базовый UINavigationController для всех кейсов, кроме контроллеров в стеке tabBar'а
final class BaseNavigationController: UINavigationController {

    // MARK: - Constants

    private enum Constants {
        static let titleFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        self.delegate = self
    }

}

// MARK: - Private Methods

private extension BaseNavigationController {

    func configureAppearance() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Colors.NavigationBar.background
            appearance.titleTextAttributes = [.foregroundColor: Colors.NavigationBar.text,
                                              .font: Constants.titleFont]
            appearance.shadowColor = .clear

            let backImage = Resources.Assets.Icons.backArrow.image
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationBar.barTintColor = Colors.NavigationBar.background
            navigationBar.titleTextAttributes = [.foregroundColor: Colors.NavigationBar.text,
                                                 .font: Constants.titleFont]
            navigationBar.shadowImage = UIImage()
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.barStyle = .default
            navigationBar.isTranslucent = false

            navigationBar.backIndicatorImage = Resources.Assets.Icons.backArrow.image
            navigationBar.backIndicatorTransitionMaskImage = Resources.Assets.Icons.backArrow.image
        }
        navigationBar.tintColor = Colors.NavigationBar.tint
    }

}

// MARK: - UINavigationControllerDelegate

extension BaseNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // убираем слово "назад" из кнопки со стрелкой
        if #available(iOS 14.0, *) {
            // настраиваем имя экрана в списке, который открывается по лонгтапу по стрелке навбара
            let title = navigationController.topViewController?.navigationItem.title?.normalized()
                ?? navigationController.topViewController?.navigationItem.backButtonTitle
            navigationController.topViewController?.navigationItem.backButtonTitle = title
            navigationController.topViewController?.navigationItem.backButtonDisplayMode = .minimal
        } else {
            let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController.topViewController?.navigationItem.backBarButtonItem = item
        }
    }

}
