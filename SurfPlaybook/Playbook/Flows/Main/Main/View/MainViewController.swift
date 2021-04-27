//
//  MainViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var container: UIView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: SearchBar!
    @IBOutlet private weak var emptyStateLabel: UILabel!

    // MARK: - NSLayoutConstraints

    @IBOutlet private weak var containerViewTopConstraint: NSLayoutConstraint!

    // MARK: - Private Properties

    private var adapter: MainAdapter?

    // MARK: - Properties

    var output: MainViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let isActiveSearch = searchBar.alpha > 0
        navigationController?.setNavigationBarHidden(isActiveSearch, animated: true)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        output?.refresh()
    }

}

// MARK: - GreetingViewInput

extension MainViewController: MainViewInput {

    func setupInitialState(with models: [ChapterModel]) {
        configureAppearance()
        adapter?.fill(with: models)
    }

    func fill(with models: [ChapterModel]) {
        adapter?.fill(with: models)
    }

    func setup(state: MainViewInputState) {
        switch state {
        case .normal:
            emptyStateLabel.isHidden = true
            tableView.isHidden = false
        case .empty(let text):
            emptyStateLabel.isHidden = false
            tableView.isHidden = true
            emptyStateLabel.text = text
            emptyStateLabel.apply(style: .textRegular14GrayCenter)
        }
    }

}

// MARK: - Appearance

private extension MainViewController {

    func configureAppearance() {
        configureNavigationBar()
        configureAdapter()
        configureSearchBar()

        view.backgroundColor = Colors.Main.background
        container.backgroundColor = Colors.Main.background
        tableView.apply(style: .default)
        setup(state: .normal)
    }

    func configureNavigationBar() {
        navigationItem.title = L10n.TabBar.Main.title
        addRightBarButton(.init(style: .search, selector: #selector(tapOnSearch)))
    }

    func configureAdapter() {
        adapter = MainAdapter(tableView: tableView)
        adapter?.onPageSelect = { [weak self] page in
            self?.closeKeyboard()
            self?.output?.showPage(page)
        }
    }

    func configureSearchBar() {
        searchBar.placeholder = L10n.Main.SearchBar.placeholder
        searchBar.alpha = 0
        searchBar.onShouldReturn = { [weak self] in
            self?.closeKeyboard()
        }
        searchBar.onCancel = { [weak self] in
            self?.closeSearch()
        }
        searchBar.onTextChanged = { [weak self] in
            let text = self?.searchBar.text ?? ""
            self?.output?.filter(by: text)
        }
    }

}

// MARK: - Actions

private extension MainViewController {

    @objc
    func tapOnSearch() {
        startSearch()
    }

}

// MARK: - Private Methods

private extension MainViewController {

    func startSearch() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        containerViewTopConstraint.constant = searchBar.bounds.height + 8
        searchBar.changeCancelButonVisibility(isVisible: true)
        searchBar.makeFirstResponder()
        UIView.animate(withDuration: AnimationTime.small) {
            self.searchBar.alpha = 1
            self.view.layoutIfNeeded()
        }
    }

    func closeSearch() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        containerViewTopConstraint.constant = 0
        searchBar.changeCancelButonVisibility(isVisible: false)
        searchBar.text = ""
        closeKeyboard()
        UIView.animate(withDuration: AnimationTime.small) {
            self.searchBar.alpha = 0
            self.view.layoutIfNeeded()
        }
    }

}
