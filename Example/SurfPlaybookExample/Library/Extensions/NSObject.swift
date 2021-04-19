//
//  NSObject.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

extension NSObject {

    @objc class var className: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

    @objc var className: String {
        if let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

}
