//
//  SettingsViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol SettingsViewInput: class {
    func setupInitialState(blocks: [SettingsBlock])
    func updateSetting(for block: SettingsBlock)
}