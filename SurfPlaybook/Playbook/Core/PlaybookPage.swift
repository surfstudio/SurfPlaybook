//
//  PlaybookPage.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/**
 Отдельная страница playbook-а.

 Содержит информацию о названии UI-компонента, ей соответствующего,
 опционально его описания, а также замыкание, при вызове которого
 можно получить UIView, содержащий данный компонент.

 Имеется возможность задать несколько вариантов отображения UI-компонента,
 для этого предусмотрен по умолчанию пустой массив `presets`
 ```
 public var presets: [(preset: StringRepresentable, config: (() -> UIView))] = []
 ```

 При генерации отображения обычных UIView или же UITableViewCell,
 которое происходит внутри замыкания `config: (() -> UIView))`,
 можно использовать вспомогательные обертки `ViewContainer` и `TableViewCellContainer`.
 Подробнее о причинах возникновения этих оберток можно прочитать в документации к этим классам.
 Посмотреть пример использования можно в example-проекте.
*/
public struct PlaybookPage {

    // MARK: - Properties

    let name: String
    let description: String?
    let config: (() -> UIView)
    var snapshot: UIImage? {
        let view = config()
        view.layoutIfNeeded()
        return view.snapshot()
    }

    // MARK: - Public Properties

    /// Массив, содержащий различные варианты конфигурации UI-компонента.
    ///
    /// Представляет собой массив элементов, где каждый состоит из двух компонентов
    /// - preset - абстрактный объект, выполняющий протокол `StringRepresentable`,
    ///     где протокол содержит лишь одно поле `title`. Так что, фактически,
    ///     это просто `название состояния`
    /// - config - замыкание, при вызове которого строится нужное состояние UI-компонента
    ///     и возвращается UIView, его содержащее
    public var presets: [(preset: StringRepresentable, config: (() -> UIView))] = []

    // MARK: - Public Initialization

    /// Конструктор для создание страницы плейбука
    ///
    /// - Parameters:
    ///     - name: название UI-компонента, будет отображено в приложении
    ///     - description: опциональное описание компонента
    ///         (пока что не используется и нигде не отображается)
    ///     - config: замыкание, при вызове которого должно строится нужное состояние UI-компонента
    ///         и возвращаться UIView, его содержащее
    public init(name: String,
                description: String?,
                config: @escaping (() -> UIView)) {
        self.name = name
        self.description = description
        self.config = config
    }

}
