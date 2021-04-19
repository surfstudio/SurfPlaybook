//
//  UIKitPageModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias UIKitPageModuleComponents = (
    view: UIViewController,
    output: UIKitPageModuleOutput
)

final class UIKitPageModuleConfigurator {

    func configure(page: PlaybookUIKitPage) -> UIKitPageModuleComponents {
        let view = UIViewController.instantiate(ofType: UIKitPageViewController.self)
        let presenter = UIKitPagePresenter(page: page)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
