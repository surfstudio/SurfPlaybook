//
//  ChapterViewController.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20/05/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ChapterViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties

    var output: ChapterViewOutput?

    // MARK: - Private Properties

    private var adapter: ChapterAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - ChapterViewInput

extension ChapterViewController: ChapterViewInput {

    func setupInitialState(with chapter: ChapterModel) {
        configureAppearance(chapter: chapter)
        adapter?.update(with: chapter.pages)
    }

}

// MARK: - Appearance

private extension ChapterViewController {

    func configureAppearance(chapter: ChapterModel) {
        configureNavigationBar(title: chapter.name)
        configureAdapter()

        view.backgroundColor = Colors.Main.background
        collectionView.backgroundColor = Colors.Main.background
    }

    func configureNavigationBar(title: String) {
        navigationItem.title = title
    }

    func configureAdapter() {
        adapter = ChapterAdapter(collectionView: collectionView)
    }

}
