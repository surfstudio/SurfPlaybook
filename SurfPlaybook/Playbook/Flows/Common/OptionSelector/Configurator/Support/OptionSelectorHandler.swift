//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

/// Протокл для модулей, которые будут связаны с модулем OptionSelector
/// и которым придется обрабатывать ответы от него
protocol OptionSelectorHandler: class {
    /// Пользователь выбрал какой-то вариант из предложенных, необходимо обработать это событие.
    /// Ошибку в случае неудачного запроса рекомендуется показывать с помощью методов input объекта
    func selectOption(_ option: StringRepresentable, input: OptionSelectorModuleInput)
}
