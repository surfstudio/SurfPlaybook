//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias OptionSelectorModuleComponents = (
    view: UIViewController,
    output: OptionSelectorModuleOutput
)

final class OptionSelectorModuleConfigurator {

    func configure(with config: OptionSelectorConfig,
                   handler: OptionSelectorHandler?) -> OptionSelectorModuleComponents {
        let view = UIViewController.instantiate(ofType: OptionSelectorViewController.self)
        let presenter = OptionSelectorPresenter(with: config, handler: handler)

        presenter.view = view
        view.output = presenter

        view.modalPresentationStyle = .overFullScreen
        view.modalTransitionStyle = .crossDissolve

        return (view, presenter)
    }

}
