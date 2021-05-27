//
//  TabBarModuleOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol TabBarModuleOutput: AnyObject {
    var onMainFlowSelect: TabSelectClosure? { get set }
    var onUIKitFlowSelect: TabSelectClosure? { get set }
    var onFlowsFlowSelect: TabSelectClosure? { get set }
    var onSettingsFlowSelect: TabSelectClosure? { get set }
}
