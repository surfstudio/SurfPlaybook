//
//  BaseCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import Foundation

/// Базовый класс для всех координаторов приложения, реализует протокол Coordinator.
/// Наследуйтесь от него для создания своего flow-координатора.
class BaseCoordinator: Coordinator {

    // MARK: - Private Properties

    private var childCoordinators: [Coordinator] = []

    // MARK: - Coordinator

    func start() {
        start(with: nil)
    }

    func start(with deepLinkOption: DeepLinkOption?) { }

    // MARK: - Methods

    func addDependency(_ coordinator: Coordinator) {
        guard !haveDependency(coordinator) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard
            !childCoordinators.isEmpty,
            let coordinator = coordinator
        else {
            return
        }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    func removeAllDependencies() {
        childCoordinators.removeAll()
    }

}

// MARK: - Private Methods

private extension BaseCoordinator {

    func haveDependency(_ coordinator: Coordinator) -> Bool {
        for element in childCoordinators {
            if element === coordinator {
                return true
            }
        }
        return false
    }

}
