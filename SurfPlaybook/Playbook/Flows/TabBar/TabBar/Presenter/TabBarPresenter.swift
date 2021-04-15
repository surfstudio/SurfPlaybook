//
//  TabBarPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class TabBarPresenter: TabBarModuleOutput {

    // MARK: - TabBarModuleOutput

    // MARK: - Properties

    weak var view: TabBarViewInput?

}

// MARK: - TabBarModuleInput

extension TabBarPresenter: TabBarModuleInput {
}

// MARK: - TabBarViewOutput

extension TabBarPresenter: TabBarViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
