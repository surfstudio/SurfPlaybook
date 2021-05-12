//
//  FlowsViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol FlowsViewInput: class, ViewStateConfigurable {
    func setupInitialState(title: String?, flowCoordinators: [PlaybookFlowCoordinator])
}
