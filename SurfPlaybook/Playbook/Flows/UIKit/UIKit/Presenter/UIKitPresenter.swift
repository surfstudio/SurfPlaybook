//
//  UIKitPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class UIKitPresenter: UIKitModuleOutput {

    // MARK: - UIKitModuleOutput

    var onPageOpen: Closure<PlaybookUIKitPage>?

    // MARK: - Properties

    weak var view: UIKitViewInput?

    // MARK: - Private Properties

    private let pages: [PlaybookUIKitPage]

    // MARK: - Initialization

    init() {
        self.pages = Playbook.shared.uiKitPages
    }

}

// MARK: - UIKitModuleInput

extension UIKitPresenter: UIKitModuleInput {
}

// MARK: - UIKitViewOutput

extension UIKitPresenter: UIKitViewOutput {

    func viewLoaded() {
        view?.setupInitialState(pages: pages)
    }

    func selectPage(id: String) {
        guard let page = pages.first(where: { $0.id == id }) else {
            return
        }
        onPageOpen?(page)
    }

}
