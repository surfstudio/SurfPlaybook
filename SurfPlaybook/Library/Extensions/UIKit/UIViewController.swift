//
//  UIViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Метод для созданния UIViewController из UINib
    static func instantiate<ViewController: UIViewController>(ofType: ViewController.Type) -> ViewController {
        return .init(nibName: ofType.className, bundle: Bundle(for: ofType))
    }

}
