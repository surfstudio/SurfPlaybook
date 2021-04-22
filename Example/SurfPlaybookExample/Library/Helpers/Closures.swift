//
//  Closures.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias EmptyClosure = () -> Void
typealias Closure<T> = (T) -> Void

typealias CGFloatClosure = (CGFloat) -> Void
typealias ViewClosure = (UIView) -> Void

typealias TabSelectClosure = (
    _ isInitial: Bool,
    _ isChanging: Bool,
    _ isStackEmpty: Bool
) -> Void
