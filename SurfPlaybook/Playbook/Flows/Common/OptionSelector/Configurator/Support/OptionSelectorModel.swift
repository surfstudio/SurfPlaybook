//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

/// Абстрактный протокол для всех возможных вариантов выбора внутри модуля OptionSelector.
/// Обязательное условие - объект должен иметь строковое представление, которое будет отображаться в UI.
protocol OptionSelectorModel {
    var title: String { get }
}
