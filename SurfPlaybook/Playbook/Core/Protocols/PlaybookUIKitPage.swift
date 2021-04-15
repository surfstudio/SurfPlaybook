//
//  PlaybookUIKitPage.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

/// Страница UIKIt-а
///
/// Протокол, определяющий страницу UIKIt-а, где каждая страница имеет
/// id, название (будет показано пользователю), а также ViewModel,
/// которая будет отвечать за построение таблицы
public protocol PlaybookUIKitPage {
    var id: String { get }
    var name: String { get }
    var viewModel: UIKitPageViewModel { get }
}
