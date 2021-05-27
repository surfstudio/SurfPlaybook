//
//  ChapterPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class ChapterPresenter: ChapterModuleOutput {

    // MARK: - ChapterModuleOutput

    var onPageShow: Closure<PlaybookPage>?

    // MARK: - Properties

    weak var view: ChapterViewInput?

    // MARK: - Private Properties

    private let chapter: ChapterModel

    // MARK: - Initialization

    init(chapter: ChapterModel) {
        self.chapter = chapter
    }

}

// MARK: - ChapterModuleInput

extension ChapterPresenter: ChapterModuleInput {
}

// MARK: - ChapterViewOutput

extension ChapterPresenter: ChapterViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: chapter)
    }

    func showPage(_ model: PageModel) {
        onPageShow?(model.playbookPage)
    }

}
