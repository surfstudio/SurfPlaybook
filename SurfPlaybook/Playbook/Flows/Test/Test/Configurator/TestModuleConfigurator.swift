//
//  TestModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TestModuleConfigurator {

    func configure() -> (UIViewController, TestModuleOutput) {
//        let view = TestViewController()
        let view = UIViewController.instantiate(ofType: TestViewController.self)
        let presenter = TestPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}

extension UIViewController {

    /// Метод для созданния UIViewController из UINib
    static func instantiate<ViewController: UIViewController>(ofType: ViewController.Type) -> ViewController {
        return .init(nibName: ofType.className, bundle: Bundle(for: ofType))
    }

}

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
