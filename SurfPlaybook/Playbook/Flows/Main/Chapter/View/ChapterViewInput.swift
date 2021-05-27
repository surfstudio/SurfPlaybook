//
//  ChapterViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol ChapterViewInput: AnyObject {
    func setupInitialState(with chapter: ChapterModel)
}
