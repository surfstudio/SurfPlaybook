//
//  TabBarCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class TabBarCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let router: Router
    private weak var tabBarInput: TabBarModuleInput?

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showTabBar()
    }

}

// MARK: - Private Methods

private extension TabBarCoordinator {

    func showTabBar() {
        let (view, output, input) = TabBarModuleConfigurator().configure()
        tabBarInput = input

        output.onMainFlowSelect = { [weak self] isInitial, isChanging, isStackEmpty in
            self?.runMainFlow(isInitial: isInitial,
                              isChanging: isChanging,
                              isStackEmpty: isStackEmpty)
        }
        output.onUIKitFlowSelect = { [weak self] isInitial, isChanging, isStackEmpty in
            self?.runUIKitFlow(isInitial: isInitial,
                               isChanging: isChanging,
                               isStackEmpty: isStackEmpty)
        }
        output.onFlowsFlowSelect = { [weak self] isInitial, isChanging, isStackEmpty in
            self?.runFlowsFlow(isInitial: isInitial,
                               isChanging: isChanging,
                               isStackEmpty: isStackEmpty)
        }
        output.onSettingsFlowSelect = { [weak self] isInitial, isChanging, isStackEmpty in
            self?.runSettingsFlow(isInitial: isInitial,
                                  isChanging: isChanging,
                                  isStackEmpty: isStackEmpty)
        }

        router.setRootModule(view)
        tabBarInput?.selectTab(.main)
    }

    func runMainFlow(isInitial: Bool,
                     isChanging: Bool,
                     isStackEmpty: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = MainCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

    func runUIKitFlow(isInitial: Bool,
                      isChanging: Bool,
                      isStackEmpty: Bool) {
         guard isInitial else {
             return
         }
         let coordinator = UIKitCoordinator(router: router)
         addDependency(coordinator)
         coordinator.start()
     }

    func runFlowsFlow(isInitial: Bool,
                      isChanging: Bool,
                      isStackEmpty: Bool) {
         guard isInitial else {
             return
         }
         let coordinator = FlowsCoordinator(router: router)
         addDependency(coordinator)
         coordinator.start()
     }

    func runSettingsFlow(isInitial: Bool,
                         isChanging: Bool,
                         isStackEmpty: Bool) {
         guard isInitial else {
             return
         }
         let coordinator = SettingsCoordinator(router: router)
         addDependency(coordinator)
         coordinator.start()
     }

}
