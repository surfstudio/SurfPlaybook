//
//  PagePresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class PagePresenter: PageModuleOutput {

    // MARK: - PageModuleOutput

    var onPresetsOpen: Closure<OptionSelectorConfig>?

    // MARK: - Properties

    weak var view: PageViewInput?

    // MARK: - Private Properties

    private let page: PlaybookPage
    private let storage: PlaybookStorageInterface
    private let notificationService: PlaybookNotificationServiceInterface
    private var selectedPreset: OptionSelectorModel?

    // MARK: - Initialization

    init(page: PlaybookPage,
         storage: PlaybookStorageInterface,
         notificationService: PlaybookNotificationServiceInterface) {
        self.page = page
        self.storage = storage
        self.notificationService = notificationService
    }

}

// MARK: - PageModuleInput

extension PagePresenter: PageModuleInput {
}

// MARK: - OptionSelectorHandler

extension PagePresenter: OptionSelectorHandler {

    func selectOption(_ option: OptionSelectorModel, input: OptionSelectorModuleInput) {
        view?.showPreset(option, for: page)
        selectedPreset = option
        input.closeSelector()
    }

}

// MARK: - PageViewOutput

extension PagePresenter: PageViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: page)
        view?.updateBackgroundAppearance(isColored: storage.isColoredBackground)
        notificationService.subscribe(self, on: .coloredBackgroundIsChanged, selector: #selector(updatePage))
    }

    func showPresets() {
        guard !page.presets.isEmpty else {
            return
        }
        let config = OptionSelectorConfig(title: page.name,
                                          values: page.presets.map { $0.preset },
                                          selectedValue: selectedPreset)
        onPresetsOpen?(config)
    }

}

// MARK: - Private Methods

private extension PagePresenter {

    @objc
    func updatePage() {
        view?.updateBackgroundAppearance(isColored: storage.isColoredBackground)
    }

}
