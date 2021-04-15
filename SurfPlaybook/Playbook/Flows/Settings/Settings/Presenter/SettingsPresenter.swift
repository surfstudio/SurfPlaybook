//
//  SettingsPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class SettingsPresenter: SettingsModuleOutput {

    // MARK: - SettingsModuleOutput

    // MARK: - Properties

    weak var view: SettingsViewInput?

}

// MARK: - SettingsModuleInput

extension SettingsPresenter: SettingsModuleInput {
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
