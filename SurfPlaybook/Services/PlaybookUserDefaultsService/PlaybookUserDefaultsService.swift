//
//  PlaybookUserDefaultsService.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

final class PlaybookUserDefaultsService: PlaybookStorageInterface {

    // MARK: - Keys

    private enum Keys {
        static let isColoredBackground = "com.playbook.isColoredBackground"
    }

    // MARK: - PlaybookStorageInterface

    var isColoredBackground: Bool {
        get { return UserDefaults.standard.bool(forKey: Keys.isColoredBackground) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.isColoredBackground) }
    }

}
