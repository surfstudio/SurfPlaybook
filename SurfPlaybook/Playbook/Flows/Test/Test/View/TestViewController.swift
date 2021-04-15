//
//  TestViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TestViewController: UIViewController {

    // MARK: - Properties

    var output: TestViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - TestViewInput

extension TestViewController: TestViewInput {

    func setupInitialState() {
    }

}
