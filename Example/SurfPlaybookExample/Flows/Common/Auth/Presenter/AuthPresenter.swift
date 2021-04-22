//
//  AuthPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class AuthPresenter: AuthModuleOutput {

    // MARK: - AuthModuleOutput

    var onClose: EmptyClosure?

    // MARK: - Properties

    weak var view: AuthViewInput?

}

// MARK: - AuthModuleInput

extension AuthPresenter: AuthModuleInput {
}

// MARK: - AuthViewOutput

extension AuthPresenter: AuthViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

    func closeView() {
        onClose?()
    }

}
