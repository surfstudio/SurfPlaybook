//
//  AuthViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var authButton: CommonButton!

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

        emailTextField.apply(style: .email)
        passwordTextField.apply(style: .password)
        authButton.apply(style: .main)
        authButton.setTitle("Войти", for: .normal)
    }

}

// MARK: - Actions

private extension AuthViewController {

    @objc
    func closeView() {
        output?.closeView()
    }

    @IBAction func authorize(_ sender: Any) {
        view.endEditing(true)
    }

}
