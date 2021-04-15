//
//  TestPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class TestPresenter: TestModuleOutput {

    // MARK: - TestModuleOutput

    // MARK: - Properties

    weak var view: TestViewInput?

}

// MARK: - TestModuleInput

extension TestPresenter: TestModuleInput {
}

// MARK: - TestViewOutput

extension TestPresenter: TestViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
