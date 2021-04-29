//
//  UIViewController+NavigationBar.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

// MARK: - Nested Types

/// Модель для хранения связки "стиль иконки" и метода, который будет вызываться по тапу на нее
struct NavigationBarItemModel {
    let style: NavigationBarItemStyle
    let selector: Selector?
}

/// Доступные стили для кнопок в навбаре
enum NavigationBarItemStyle {
    case close

    var image: UIImage {
        switch self {
        case .close:
            return Resources.Assets.Icons.cross.image
        }
    }
}

// MARK: - Methods for adding left/right buttonItems to navigationItem

extension UIViewController {

    @discardableResult
    func addLeftBarButton(_ item: NavigationBarItemModel, animated: Bool = false) -> UIBarButtonItem {
        let leftBarButtonItem = getBarButtonItem(by: item)
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: animated)
        return leftBarButtonItem
    }

    @discardableResult
    func addLeftBarButtons(_ items: [NavigationBarItemModel], animated: Bool = false) -> [UIBarButtonItem] {
        let buttonItems = items.map { getBarButtonItem(by: $0) }
        navigationItem.setLeftBarButtonItems(buttonItems.isEmpty ? nil : buttonItems, animated: animated)
        return buttonItems
    }

    @discardableResult
    func addRightBarButton(_ item: NavigationBarItemModel, animated: Bool = false) -> UIBarButtonItem {
        let rightBarButtonItem = getBarButtonItem(by: item)
        navigationItem.setRightBarButton(rightBarButtonItem, animated: animated)
        return rightBarButtonItem
    }

    @discardableResult
    func addRightBarButtons(_ items: [NavigationBarItemModel], animated: Bool = false) -> [UIBarButtonItem] {
        let buttonItems = items.map { getBarButtonItem(by: $0) }
        navigationItem.setRightBarButtonItems(buttonItems.isEmpty ? nil : buttonItems, animated: animated)
        return buttonItems
    }

}

// MARK: - Fileprivate UIViewController extension

fileprivate extension UIViewController {

    func getBarButtonItem(by model: NavigationBarItemModel) -> UIBarButtonItem {
        return UIBarButtonItem(image: model.style.image,
                               style: .plain,
                               target: self,
                               action: model.selector)
    }

}
