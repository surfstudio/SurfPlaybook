//
//  UIKitViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitViewController: UIViewController {

    // MARK: - Properties

    var output: UIKitViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - UIKitViewInput

extension UIKitViewController: UIKitViewInput {

    func setupInitialState() {
    }

}
