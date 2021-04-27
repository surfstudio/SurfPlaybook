//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class OptionSelectorPresenter: OptionSelectorModuleOutput {

    // MARK: - OptionSelectorModuleOutput

    var onClose: EmptyClosure?

    // MARK: - Properties

    weak var view: OptionSelectorViewInput?

    // MARK: - Private Properties

    private let config: OptionSelectorConfig
    private let handler: OptionSelectorHandler?

    // MARK: - Initialization

    init(with config: OptionSelectorConfig,
         handler: OptionSelectorHandler?) {
        self.config = config
        self.handler = handler
    }

}

// MARK: - OptionSelectorModuleInput

extension OptionSelectorPresenter: OptionSelectorModuleInput {

    func closeSelector() {
        onClose?()
    }

}

// MARK: - OptionSelectorViewOutput

extension OptionSelectorPresenter: OptionSelectorViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: config)
    }

    func selectValue(_ value: StringRepresentable) {
        handler?.selectOption(value, input: self)
    }

    func closeModule() {
        onClose?()
    }

}
