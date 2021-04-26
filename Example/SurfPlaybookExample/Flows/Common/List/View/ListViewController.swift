//
//  ListViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 26/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: - Properties

    var output: ListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - ListViewInput

extension ListViewController: ListViewInput {

    func setupInitialState() {
    }

}
