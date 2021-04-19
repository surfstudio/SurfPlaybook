//
//  TestFlowCoordinator.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import SurfPlaybook

final class TestFlowCoordinator: PlaybookFlowCoordinator {

    // MARK: - Private Properties

    private let router = MainRouter()

    // MARK: - PlaybookFlowCoordinator

    var id: String {
        return "TestFlowCoordinator"
    }

    var name: String {
        return "Тестовый экран"
    }

    func start() {
        let view = TestViewController()
        router.push(view)
    }

}
