//
//  PlaybookPage.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Отдельная страница playbook-а.
///
/// Содержит информацию о названии элемента, ей соответствующего,
/// опционально его описания, а также замыкание, по которому можно построить reuse-компонент
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
    var presets: [(preset: OptionSelectorModel, config: (() -> UIView))] = []

    // MARK: - Public Initialization

    public init(name: String,
                description: String?,
                config: @escaping (() -> UIView)) {
        self.name = name
        self.description = description
        self.config = config
    }

}
