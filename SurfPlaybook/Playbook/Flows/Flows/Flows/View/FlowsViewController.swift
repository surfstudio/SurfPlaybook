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

    func setupInitialState(flowCoordinators: [PlaybookFlowCoordinator]) {
        configureAppearance()
        adapter?.fill(with: flowCoordinators)
    }

}

// MARK: - Appearance

private extension FlowsViewController {

    func configureAppearance() {
        navigationItem.title = StringsConfig.flowsTabTitle
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
