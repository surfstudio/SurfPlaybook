//
//  DesignConstants.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

/// Reusable time intervals for animations
/// Возможные продолжительности анимации
enum AnimationTime {
    static let tiny: TimeInterval = 0.1
    static let small: TimeInterval = 0.2
    /// Стандартная продолжительность анимации показа/сокрытия клавиатуры
    static let keyboard: TimeInterval = 0.25
    static let `default`: TimeInterval = 0.3
    static let medium: TimeInterval = 0.4
}
