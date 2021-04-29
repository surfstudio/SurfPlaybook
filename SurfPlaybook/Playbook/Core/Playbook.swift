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
/// Обращение к нему должно всегда идти через singltone `shared`.
/// Концепт следующий: как книга содержит главы, которые состоят из страниц,
/// так и playbook состоит из chapters, которые состоят из pages.
///
/// Для инилиализации playbook-а необходимо:
/// - при старте приложения взять синглтон - Playbook.shared
/// - добавить к нему необходимые главы
/// - каждой главе соответствует группа каких-либо reuse-компонентов
/// - при инициализации главы - добавить в нее необходимые Pages
/// - каждой Page соответствует свой reuse-компонент
/// - после чего вызвать метод `start(from window: UIWindow?)`
public final class Playbook {

    // MARK: - Public Properties

    /// Вся работа с плейбуком должна вестись через данный singltone
    public static var shared = Playbook()

    // MARK: - Properties

    private(set) var chapters: [PlaybookChapter] = []
    private(set) var uiKitPages: [PlaybookUIKitPage] = []
    private(set) var flowCoordinators: [PlaybookFlowCoordinator] = []

    // MARK: - Private Properties

    private let coordinator = PlaybookCoordinator()

    // MARK: - Public Methods

    /// Метод для показа плейбука
    ///
    /// При старте приложения требуется вызвать этот метод, передав ему соответствующее window,
    /// на котором будет показан playbook, предварительно заполнив его необходимыми компонентами.
    public func start(from window: UIWindow?) {
        coordinator.start()
    }

    /// Метод для добавления соответствующих глав с reuse-компонентами в playbook
    ///
    /// Каждой главе будет соответствовать карусель на главном экране со страницами из этой главы.
    @discardableResult
    public func add(chapter: PlaybookChapter) -> Playbook {
        chapters.append(chapter)
        return self
    }

    /// Метод для добавления страницы для UIKIt-а
    ///
    /// Каждой странице будет соответствовать свой пункт меню на вкладке приложения про UIKit.
    /// Более подробно можно прочесть в документации к `PlaybookUIKitPage`
    @discardableResult
    public func add(uiKitPage: PlaybookUIKitPage) -> Playbook {
        uiKitPages.append(uiKitPage)
        return self
    }

    /// Метод для добавления абстрактного координатора,
    /// позволяющего показать экран или запустить целый flow приложения
    ///
    /// Каждому добавленному экземпляру `PlaybookFlowCoordinator` будет соответствовать свой пункт меню
    /// на соответствующей вкладке приложения.
    /// `PlaybookFlowCoordinator` позволяет запустить экран
    /// или целый flow экранов вашего приложения в рамках playbook-а.
    /// Более подробно можно прочесть в документации к `PlaybookFlowCoordinator`
    @discardableResult
    public func add(flowCoordinator: PlaybookFlowCoordinator) -> Playbook {
        flowCoordinators.append(flowCoordinator)
        return self
    }

}
