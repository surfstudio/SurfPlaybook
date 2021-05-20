//
//  ChapterModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ChapterModuleConfigurator {

    func configure() -> (UIViewController, ChapterModuleOutput) {
        let view = ChapterViewController()
        let presenter = ChapterPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
