//
//  Copyright © 2020 Surf. All rights reserved.
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
