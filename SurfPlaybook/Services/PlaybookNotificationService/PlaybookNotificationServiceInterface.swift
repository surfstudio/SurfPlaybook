//
//  PlaybookNotificationServiceInterface.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

protocol PlaybookNotificationServiceInterface {
    /// Метод позволяет запостить нотификацию
    func post(_ notification: PlaybookNotificationType)
    /// Метод позволяет подписаться на нотификацию
    func subscribe(_ observer: Any, on notification: PlaybookNotificationType, selector: Selector)
}
