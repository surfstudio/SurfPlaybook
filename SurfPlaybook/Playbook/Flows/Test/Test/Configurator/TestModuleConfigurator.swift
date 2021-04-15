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
        let view = UIViewController.instantiate(ofType: TestViewController.self)
        let presenter = TestPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
