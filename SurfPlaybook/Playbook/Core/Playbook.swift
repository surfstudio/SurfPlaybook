//
//  Playbook.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Основной класс для всей механики playbook-а.
///
/// Обращение к нему должно всегда идти через singltone.
/// Концепт следующий: как книги содерит главы, которые состоят из страниц,
/// так и playbook состоит из chapters, которые состоят из pages.
///
/// Для инилиализации playbook-а необходимо:
/// - взять синглтон - Playbook.shared
/// - добавить к нему необходимые главы
/// - каждой главе соответствует группа каких-либо reuse-компонентов
/// - главы объявлены в директории Chapters
/// - при инициализации главы - добавить в нее необходимые Pages
/// - каждой Page соответствует свой reuse-компонент
public final class Playbook {

    // MARK: - Public Properties

    public static var shared = Playbook()

    // MARK: - Properties

    private(set) var chapters: [PlaybookChapter] = []
    private(set) var uiKitPages: [PlaybookUIKitPage] = []
    private(set) var flowCoordinators: [PlaybookFlowCoordinator] = []

    // MARK: - Public Methods

    public func start(from window: UIWindow?) {
        let (view, _) = TestModuleConfigurator().configure()
        window?.rootViewController = view
    }

    @discardableResult
    public func add(chapter: PlaybookChapter) -> Playbook {
        chapters.append(chapter)
        return self
    }

    @discardableResult
    public func add(uiKitPage: PlaybookUIKitPage) -> Playbook {
        uiKitPages.append(uiKitPage)
        return self
    }

    @discardableResult
    public func add(flowCoordinator: PlaybookFlowCoordinator) -> Playbook {
        flowCoordinators.append(flowCoordinator)
        return self
    }

}
