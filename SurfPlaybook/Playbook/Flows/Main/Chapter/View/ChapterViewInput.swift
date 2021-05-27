//
//  ChapterViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol ChapterViewInput: class {
    /// Method for setup initial state of view
    func setupInitialState(with chapter: ChapterModel)
}
