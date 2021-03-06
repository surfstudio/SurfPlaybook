//
//  MainModuleOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol MainModuleOutput: AnyObject {
    var onPageShow: Closure<PlaybookPage>? { get set }
    var onChapterShow: Closure<ChapterModel>? { get set }
}
