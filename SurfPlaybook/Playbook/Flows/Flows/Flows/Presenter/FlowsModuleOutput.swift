//
//  FlowsModuleOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol FlowsModuleOutput: AnyObject {
    var onFlowsShow: Closure<(title: String, coordinators: [PlaybookFlowCoordinator])>? { get set }
}
