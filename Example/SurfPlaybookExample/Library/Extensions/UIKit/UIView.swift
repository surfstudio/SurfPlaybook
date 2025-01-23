//
//  UIView.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import UIKit

extension UIView {

    /// Рекурсивная функция для поиска ближайшего контроллера
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
