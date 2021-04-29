//
//  PlaybookChapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Отдельная глава Playbook-а.
///
/// Каждой главе соответствует своя карусель на главной странице.
/// Представляет собой набор страниц, `PlaybookPage`, где каждой странице соответствует
/// свой reuse-компонент, который необходимо отобразить в рамках playbook-а.
public final class PlaybookChapter {

    // MARK: - Properties

    let name: String
    private(set) var pages: [PlaybookPage]
    /// Позволяет получить snapshot-ы всех страниц плейбука
    var snapshots: [UIImage?] {
        return pages.map { $0.snapshot }
    }

    // MARK: - Public Initialization

    /// Конструктор главы плейбука
    ///
    /// - Parameters:
    ///     - name: имя главы, которое будет отображено на главной странице
    ///     - pages: страницы данной главы,
    ///     могут быть пустыми и добавлены после инициализации объекта
    public init(name: String, pages: [PlaybookPage]) {
        self.name = name
        self.pages = pages
    }

    // MARK: - Public Methods

    @discardableResult
    public func add(page: PlaybookPage) -> PlaybookChapter {
        pages.append(page)
        return self
    }

}
