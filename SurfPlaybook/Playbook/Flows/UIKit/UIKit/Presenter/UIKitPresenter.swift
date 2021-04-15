//
//  UIKitPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class UIKitPresenter: UIKitModuleOutput {

    // MARK: - UIKitModuleOutput

    // MARK: - Properties

    weak var view: UIKitViewInput?

}

// MARK: - UIKitModuleInput

extension UIKitPresenter: UIKitModuleInput {
}

// MARK: - UIKitViewOutput

extension UIKitPresenter: UIKitViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
