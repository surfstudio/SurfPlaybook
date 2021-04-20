//
//  MainViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol MainViewInput: class {
    func setupInitialState(with models: [ChapterModel])
    func fill(with models: [ChapterModel])
    func setup(state: MainViewInputState)
}

enum MainViewInputState {
    case normal
    case empty(text: String)
}
