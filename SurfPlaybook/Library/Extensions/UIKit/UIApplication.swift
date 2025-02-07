//
//  UIApplication.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UIApplication {

    // MARK: - Static Properties

    static var rootView: UIViewController? {
        return firstKeyWindow?.rootViewController
    }

    static var firstKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }
        } else {
            UIApplication.shared.keyWindow
        }
    }

    // MARK: - Static Methods

    /// Возвращает "топовый" viewController в текущей иерархии приложения
    ///
    /// Под капотом происходит рекурсивный вызов данного метода,
    /// логика выполнения такова, что ищется navigation/tabBar-контроллеры
    /// или модалка, если находится - то метод вызывается рекурсивно, на вход подается
    /// найденные navigation/tabBar-контроллеры или же модалка.
    /// Если же ничего из вышеперечисленного не нашлось - то возвращается UIViewController,
    /// поданый на вход
    static func topViewController(_ controller: UIViewController? = UIApplication.rootView) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }
        return controller
    }

}
