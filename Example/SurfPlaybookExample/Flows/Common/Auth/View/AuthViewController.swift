//
//  AuthViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {

    // MARK: - Properties

    var output: AuthViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - AuthViewInput

extension AuthViewController: AuthViewInput {

    func setupInitialState() {
        configureAppearance()
    }

}

// MARK: - Appearance

private extension AuthViewController {

    func configureAppearance() {
        navigationItem.title = "Вход"
        addRightBarButton(.init(style: .close, selector: #selector(closeView)))
    }

}

// MARK: - Actions

private extension AuthViewController {

    @objc
    func closeView() {
        output?.closeView()
    }

}
