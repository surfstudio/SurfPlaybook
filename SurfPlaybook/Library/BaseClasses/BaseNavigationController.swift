//
//  BaseNavigationController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Базовый UINavigationController для всех кейсов, кроме контроллеров в стеке tabBar'а
final class BaseNavigationController: UINavigationController {

    // MARK: - Constants

    private enum Constants {
        static let titleFont: FontConvertible.Font = FontFamily.SFProText.semibold.font(size: 17)
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
        navigationBar.barTintColor = Colors.NavigationBar.background
        navigationBar.tintColor = Colors.NavigationBar.tint
        navigationBar.titleTextAttributes = [.foregroundColor: Colors.NavigationBar.text,
                                             .font: Constants.titleFont]
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.barStyle = .default
        navigationBar.isTranslucent = false

        navigationBar.backIndicatorImage = Resources.Assets.Icons.backArrow.image
        navigationBar.backIndicatorTransitionMaskImage = Resources.Assets.Icons.backArrow.image
    }

}

// MARK: - UINavigationControllerDelegate

extension BaseNavigationController: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
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
