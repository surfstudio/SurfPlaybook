//
//  TabBarViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TabBarViewController: UIViewController {

    // MARK: - Properties

    var output: TabBarViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - TabBarViewInput

extension TabBarViewController: TabBarViewInput {

    func setupInitialState() {
    }

}
