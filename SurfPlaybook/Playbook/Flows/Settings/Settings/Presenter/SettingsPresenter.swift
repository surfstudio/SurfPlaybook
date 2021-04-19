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

    // MARK: - Private Properties

    private let storage: PlaybookStorageInterface
    private let notificationService: PlaybookNotificationServiceInterface

    // MARK: - Initialization

    init(storage: PlaybookStorageInterface,
         notificationService: PlaybookNotificationServiceInterface) {
        self.storage = storage
        self.notificationService = notificationService
    }

}

// MARK: - SettingsModuleInput

extension SettingsPresenter: SettingsModuleInput {
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {

    func viewLoaded() {
        view?.setupInitialState(blocks: [
            PlaybookSettings.coloredBackground.block(with: storage)
        ])
    }

    func toggleSetting(for block: SettingsBlock) {
        guard let setting = PlaybookSettings.setting(by: block) else {
            return
        }
        setting.toggle(with: storage)
        switch setting {
        case .coloredBackground:
            notificationService.post(.coloredBackgroundIsChanged)
        }
        view?.updateSetting(for: setting.block(with: storage))
    }

}
