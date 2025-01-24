//
//  MainPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class MainPresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var onPageShow: Closure<PlaybookPage>?
    var onChapterShow: Closure<ChapterModel>?

    // MARK: - Properties

    weak var view: MainViewInput?

    // MARK: - Private Properties

    private let chaptersModels: [ChapterModel]
    private var searchString = ""

    // MARK: - Initialization

    init() {
        self.chaptersModels = Playbook.shared.chapters.map { ChapterModel(from: $0) }
    }

}

// MARK: - MainModuleInput

extension MainPresenter: MainModuleInput {
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: chaptersModels)
    }

    func showPage(_ model: PageModel) {
        onPageShow?(model.playbookPage)
    }

    func showChapter(_ model: ChapterModel) {
        guard let chapter = chaptersModels.first(where: { $0.name == model.name }) else {
            return
        }
        onChapterShow?(chapter)
    }

    func filter(by text: String) {
        searchString = text
        guard !text.isEmpty else {
            view?.setup(state: .normal)
            view?.fill(with: chaptersModels)
            return
        }

        let filteredChapters = chaptersModels
            .map { ChapterModel(name: $0.name,
                                pages: $0.pages.filter { $0.isContain(text: text) })
            }
            .filter { !$0.pages.isEmpty }
        if filteredChapters.isEmpty {
            view?.setup(state: .empty(text: StringsConfig.emptySearchMessage))
        } else {
            view?.setup(state: .normal)
            view?.fill(with: filteredChapters)
        }
    }

    func refresh() {
        filter(by: searchString)
    }

}
