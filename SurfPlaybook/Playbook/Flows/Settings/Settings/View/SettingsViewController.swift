//
//  SettingsViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - Properties

    var output: SettingsViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - SettingsViewInput

extension SettingsViewController: SettingsViewInput {

    func setupInitialState() {
    }

}
