//
//  UIKitModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitModuleConfigurator {

    func configure() -> (UIViewController, UIKitModuleOutput) {
        let view = UIViewController.instantiate(ofType: UIKitViewController.self)
        let presenter = UIKitPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
