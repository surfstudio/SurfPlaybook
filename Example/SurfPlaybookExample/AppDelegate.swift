//
//  AppDelegate.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 13.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit
import SurfPlaybook

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()

        Playbook.shared
            .add(chapter: ControlsChapter().build())
            .add(chapter: CellsChapter().build())
        Playbook.shared
            .add(uiKitPage: ColorsUIKitPage())
        Playbook.shared
            .add(flowCoordinator: AuthFlowCoordinator())
            .add(flowCoordinator: ListFlowCoordinator())
        configurePlaybookColors()

        Playbook.shared.start(from: self.window)
        return true
    }

}

// MARK: - Pirvate Methods

private extension AppDelegate {

    func configurePlaybookColors() {
        var config = ColorsConfig.shared

        config.main.active = Colors.Main.active
        config.main.background = Colors.Main.background
        config.main.press = Colors.Main.pressedBackground
        config.main.coloredBackground = Colors.Main.pressedBackground
        config.main.translucent = Colors.Main.pressedBackground.withAlphaComponent(0.5)
        config.main.separator = Colors.Main.separator

        config.text.active = Colors.Main.active
        config.text.main = Colors.Text.main
        config.text.second = Colors.Text.second

        config.navigationBar.text = Colors.NavigationBar.text
        config.navigationBar.tint = Colors.NavigationBar.tint
        config.navigationBar.background = Colors.NavigationBar.background

        config.tabBar.selectedItemTint = Colors.Main.active
        config.tabBar.background = Colors.Main.background

        config.searchBar.container = Colors.Main.pressedBackground
        config.searchBar.text = Colors.TextField.text
        config.searchBar.placeholder = Colors.TextField.placeholder
        config.searchBar.tint = Colors.TextField.tint

        ColorsConfig.shared = config
    }

}
