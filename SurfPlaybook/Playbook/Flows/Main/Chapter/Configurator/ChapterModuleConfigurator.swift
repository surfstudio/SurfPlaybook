//
//  ChapterModuleConfigurator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ChapterModuleConfigurator {

    func configure(chapter: ChapterModel) -> (UIViewController, ChapterModuleOutput) {
        let view = UIViewController.instantiate(ofType: ChapterViewController.self)
        let presenter = ChapterPresenter(chapter: chapter)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
