//
//  ChapterModuleOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol ChapterModuleOutput: AnyObject {
    var onPageShow: Closure<PlaybookPage>? { get set }
}
