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
        return .init(nibName: ofType.className, bundle: Bundle.shared(for: ofType))
    }

    /// Вызов метода приводит к закрытию клавиатуры,
    /// если на экране есть открытая клавиатура
    func closeKeyboard() {
        view.endEditing(true)
        navigationController?.navigationBar.endEditing(true)
    }

}
