//
//  PageModuleOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol PageModuleOutput: class {
    var onPresetsOpen: Closure<OptionSelectorConfig>? { get set }
}
