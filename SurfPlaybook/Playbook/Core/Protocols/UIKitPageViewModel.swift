//
//  UIKitPageViewModel.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Протокол для объекта, способного построить табличный экран
/// для показа страницы UIKit-а
public protocol UIKitPageViewModel {
    /// При вызове данного метода необходимо заполнить экран переданной таблицы
    /// контентом на ваше усмотрение.
    func setup(with tableView: UITableView)
}
