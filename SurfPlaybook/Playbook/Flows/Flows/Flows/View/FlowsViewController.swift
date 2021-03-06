//
//  FlowsViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class FlowsViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStateLabel: UILabel!

    // MARK: - Properties

    var output: FlowsViewOutput?

    // MARK: - Private Properties

    private var adapter: FlowsAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - FlowsViewInput

extension FlowsViewController: FlowsViewInput {

    func setupInitialState(title: String?, flowCoordinators: [PlaybookFlowCoordinator]) {
        configureAppearance(title: title)
        if flowCoordinators.isEmpty {
            setup(state: .empty(text: StringsConfig.emptyStateMessage))
        } else {
            setup(state: .normal)
            adapter?.fill(with: flowCoordinators)
        }
    }

}

// MARK: - ViewStateConfigurable

extension FlowsViewController: ViewStateConfigurable {

    func setup(state: ViewState) {
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

private extension FlowsViewController {

    func configureAppearance(title: String?) {
        navigationItem.title = title ?? StringsConfig.flowsTabTitle
        view.backgroundColor = Colors.Main.background
        tableView.apply(style: .default)
        configureAdapter()
    }

    func configureAdapter() {
        adapter = FlowsAdapter(tableView: tableView)
        adapter?.onSelectFlowCoordinator = { [weak self] id in
            self?.output?.selectFlowCoordinator(id: id)
        }
    }

}
