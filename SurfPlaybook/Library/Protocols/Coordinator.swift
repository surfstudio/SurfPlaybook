//
//  Coordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

/// Базовый протокол для всех координаторов приложения
protocol Coordinator: AnyObject {
    /// Уведомляет координатора, что он должен начать свою работу
    func start()
    /// Уведомляет координатора, что он может начать свою работу,
    /// опираясь на переданный deepLinkOption
    ///
    /// - parameter deepLinkOption: глобальный параметр DeepLinkOption, задающий навигацию в приложении
    ///                             при обработке deepLink-ов, пушей и тд
    func start(with deepLinkOption: DeepLinkOption?)
}
