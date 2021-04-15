//
//  TabBarViewOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol TabBarViewOutput {
    /// Пользователь выбрал другой таб
    ///
    /// - Parameter tab: таб, который выбрал пользователь
    /// - Parameter isInitial: true, если в navigationController'е таба отсутствуют экраны (стек пуст)
    /// - Parameter isStackEmpty: true, если в текущий момент отображается рутовый контроллер таба
    func selectTab(with tab: PlaybookTab, isInitial: Bool, isStackEmpty: Bool)
}
