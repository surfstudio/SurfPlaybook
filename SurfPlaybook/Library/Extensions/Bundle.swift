//
//  Bundle.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 30.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

extension Bundle {

    static func shared(for type: AnyClass) -> Bundle {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: type)
        #endif
    }

}
