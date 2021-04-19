//
//  PlaybookNotificationService.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

final class PlaybookNotificationService: PlaybookNotificationServiceInterface {

    // MARK: - PlaybookNotificationServiceInterface

    func post(_ notification: PlaybookNotificationType) {
        NotificationCenter.default.post(Notification(name: notification.name,
                                                     object: nil,
                                                     userInfo: nil))
    }

    func subscribe(_ observer: Any, on notification: PlaybookNotificationType, selector: Selector) {
        NotificationCenter.default.addObserver(observer,
                                               selector: selector,
                                               name: notification.name,
                                               object: nil)
    }

}
