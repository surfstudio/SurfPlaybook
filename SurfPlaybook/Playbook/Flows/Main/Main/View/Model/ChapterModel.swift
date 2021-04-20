//
//  ChapterModel.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

struct ChapterModel {
    let name: String
    let pages: [PageModel]

    init(from chapter: PlaybookChapter) {
        self.name = chapter.name
        self.pages = chapter.pages.map { PageModel(from: $0) }
    }

    init(name: String, pages: [PageModel]) {
        self.name = name
        self.pages = pages
    }

}

struct PageModel {
    let name: String
    let image: UIImage?
    let playbookPage: PlaybookPage

    init(from page: PlaybookPage) {
        self.name = page.name
        self.image = page.snapshot
        self.playbookPage = page
    }
}
