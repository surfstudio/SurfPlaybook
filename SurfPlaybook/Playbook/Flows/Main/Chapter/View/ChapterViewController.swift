//
//  ChapterViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ChapterViewController: UIViewController {

    // MARK: - Properties

    var output: ChapterViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - ChapterViewInput

extension ChapterViewController: ChapterViewInput {

    func setupInitialState() {
    }

}
