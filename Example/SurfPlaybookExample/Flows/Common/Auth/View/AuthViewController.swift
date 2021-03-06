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
        navigationItem.title = L10n.Auth.title
        view.backgroundColor = Colors.Main.background
        addRightBarButton(.init(style: .close, selector: #selector(closeView)))

        emailTextField.apply(style: .email)
        passwordTextField.apply(style: .password)
        authButton.apply(style: .main)
        authButton.setTitle(L10n.Auth.Button.title, for: .normal)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(gesture)
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

    @objc
    func tapOnView() {
        view.endEditing(true)
    }

}
