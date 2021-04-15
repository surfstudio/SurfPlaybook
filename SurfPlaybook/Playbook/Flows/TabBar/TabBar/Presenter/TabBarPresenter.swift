//
//  TabBarPresenter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class TabBarPresenter: TabBarModuleOutput {

    // MARK: - TabBarModuleOutput

    var onMainFlowSelect: TabSelectClosure?
    var onUIKitFlowSelect: TabSelectClosure?
    var onFlowsFlowSelect: TabSelectClosure?
    var onSettingsFlowSelect: TabSelectClosure?

    // MARK: - Properties

    weak var view: TabBarViewInput?

    // MARK: - Private Properties

    private var currentTab: PlaybookTab? = .main

}

// MARK: - MainTabBarModuleInput

extension TabBarPresenter: TabBarModuleInput {

    func selectTab(_ tab: PlaybookTab) {
        view?.selectTab(tab)
    }

}

// MARK: - TabBarViewOutput

extension TabBarPresenter: TabBarViewOutput {

    func selectTab(with tab: PlaybookTab, isInitial: Bool, isStackEmpty: Bool) {
        let isChanging = currentTabIsChanged(newTab: tab)
        switch tab {
        case .main:
            onMainFlowSelect?(isInitial, isChanging, isStackEmpty)
        case .uiKit:
            onUIKitFlowSelect?(isInitial, isChanging, isStackEmpty)
        case .flows:
            onFlowsFlowSelect?(isInitial, isChanging, isStackEmpty)
        case .settings:
            onSettingsFlowSelect?(isInitial, isChanging, isStackEmpty)
        }
        currentTab = tab
    }

}

// MARK: - Private Methods

private extension TabBarPresenter {

    func currentTabIsChanged(newTab: PlaybookTab) -> Bool {
        return currentTab != newTab
    }

}
