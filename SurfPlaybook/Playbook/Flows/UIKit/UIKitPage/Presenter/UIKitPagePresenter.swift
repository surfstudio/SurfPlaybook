//
//  UIKitPagePresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class UIKitPagePresenter: UIKitPageModuleOutput {

    // MARK: - UIKitPageModuleOutput

    // MARK: - Properties

    weak var view: UIKitPageViewInput?

    // MARK: - Private Properties

    private let page: PlaybookUIKitPage

    // MARK: - Initialization

    init(page: PlaybookUIKitPage) {
        self.page = page
    }

}

// MARK: - UIKitPageModuleInput

extension UIKitPagePresenter: UIKitPageModuleInput {
}

// MARK: - UIKitPageViewOutput

extension UIKitPagePresenter: UIKitPageViewOutput {

    func viewLoaded() {
        view?.setupInitialState(page: page)
    }

}
