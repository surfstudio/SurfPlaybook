//
//  Router.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

/// Describes object that handles all navigation operations
protocol Router {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)

    func popModule()
    func popModule(animated: Bool)
    func popPreviousView()
    func popToRoot(animated: Bool)

    func dismissModule()
    func dismissModule(from module: Presentable?)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func dismissAll(animated: Bool, completion: (() -> Void)?)

    func setNavigationControllerRootModule(_ module: Presentable?, animated: Bool, hideBar: Bool)
    func setRootModule(_ module: Presentable?)

    func setTab(_ index: Int)
}
