//
//  FlowsModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class FlowsModuleConfigurator {

    func configure(coordinators: [PlaybookFlowCoordinator]) -> (UIViewController, FlowsModuleOutput) {
        let view = UIViewController.instantiate(ofType: FlowsViewController.self)
        let presenter = FlowsPresenter(coordinators: coordinators)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
