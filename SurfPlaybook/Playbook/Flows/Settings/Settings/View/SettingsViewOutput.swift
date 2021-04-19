//
//  SettingsViewOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol SettingsViewOutput {
    func viewLoaded()
    func toggleSetting(for block: SettingsBlock)
}
