//
//  UIViewController+SUI.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import UIKit
import SwiftUI

@available(iOS 13.0, *)
extension UIViewController {

    @discardableResult
    func hostSwiftUIView<T: View>(view: T) -> UIHostingController<T> {
        let hostingController = UIHostingController(rootView: view)
        addChild(hostingController)
        hostingController.didMove(toParent: self)
        if #available(iOS 16.0, *) {
            hostingController.sizingOptions = [.intrinsicContentSize]
        }
        return hostingController
    }

}
