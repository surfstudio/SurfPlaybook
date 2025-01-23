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
            .add(chapter: TableCellsChapter().build())

        if #available(iOS 13.0, *) {
            Playbook.shared.add(chapter: CollectionCellsChapter().build())
        }

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
        ColorsConfig.Main.active = Colors.Main.active
        ColorsConfig.Main.background = Colors.Main.background
        ColorsConfig.Main.press = Colors.Main.pressedBackground
        ColorsConfig.Main.coloredBackground = Colors.Main.pressedBackground
        ColorsConfig.Main.separator = Colors.Main.separator

        ColorsConfig.Text.active = Colors.Main.active
        ColorsConfig.Text.main = Colors.Text.main
        ColorsConfig.Text.second = Colors.Text.second

        ColorsConfig.NavigationBar.text = Colors.NavigationBar.text
        ColorsConfig.NavigationBar.tint = Colors.NavigationBar.tint
        ColorsConfig.NavigationBar.background = Colors.NavigationBar.background

        ColorsConfig.TabBar.selectedItemTint = Colors.Main.active
        ColorsConfig.TabBar.background = Colors.Main.background

        ColorsConfig.SearchBar.container = Colors.Main.pressedBackground
        ColorsConfig.SearchBar.text = Colors.TextField.text
        ColorsConfig.SearchBar.placeholder = Colors.TextField.placeholder
        ColorsConfig.SearchBar.tint = Colors.TextField.tint
    }

}
