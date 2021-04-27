//
//  PageViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class PageViewController: UIViewController {

    // MARK: - Properties

    var output: PageViewOutput?

    // MARK: - Private Properties

    private var contentView: UIView?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

// MARK: - GreetingViewInput

extension PageViewController: PageViewInput {

    func setupInitialState(with page: PlaybookPage) {
        configureAppearance(with: page)
    }

    func showPreset(_ preset: OptionSelectorModel, for page: PlaybookPage) {
        guard let preset = page.presets.first(where: { $0.preset.title == preset.title }) else {
            return
        }
        configureContent(contentView: preset.config())
    }

    func updateBackgroundAppearance(isColored: Bool) {
        view.backgroundColor = isColored ? Colors.Main.coloredBackground : Colors.Main.background
    }

}

// MARK: - Appearance

private extension PageViewController {

    func configureAppearance(with page: PlaybookPage) {
        configureNavigationBar(with: page)
        configureContent(contentView: page.config())
        configureGesture()
    }

    func configureNavigationBar(with page: PlaybookPage) {
        navigationItem.title = page.name
        if !page.presets.isEmpty {
            addRightBarButton(.init(style: .sort, selector: #selector(showPresets)))
        }
    }

    func configureContent(contentView: UIView) {
        self.contentView?.removeFromSuperview()
        self.contentView = contentView
        self.view.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    func configureGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }

}

// MARK: - UIGestureRecognizerDelegate

extension PageViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let content = contentView else {
            return true
        }
        return !(touch.view?.isDescendant(of: content) ?? true)
    }

}

// MARK: - Actions

private extension PageViewController {

    @objc
    func tapOnView() {
        closeKeyboard()
    }

    @objc
    func showPresets() {
        output?.showPresets()
    }

}
