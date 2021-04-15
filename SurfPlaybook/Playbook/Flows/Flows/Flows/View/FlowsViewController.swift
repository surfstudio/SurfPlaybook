//
//  FlowsViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class FlowsViewController: UIViewController {

    // MARK: - Properties

    var output: FlowsViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - FlowsViewInput

extension FlowsViewController: FlowsViewInput {

    func setupInitialState() {
    }

}
