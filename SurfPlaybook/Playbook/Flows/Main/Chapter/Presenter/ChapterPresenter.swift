//
//  ChapterPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class ChapterPresenter: ChapterModuleOutput {

    // MARK: - ChapterModuleOutput

    // MARK: - Properties

    weak var view: ChapterViewInput?

}

// MARK: - ChapterModuleInput

extension ChapterPresenter: ChapterModuleInput {
}

// MARK: - ChapterViewOutput

extension ChapterPresenter: ChapterViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
