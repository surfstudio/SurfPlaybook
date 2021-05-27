//
//  ChapterAdapter.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 27.05.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ChapterAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let cellHeight: CGFloat = 209
        static let sectionInset: UIEdgeInsets = .init(top: 20, left: 8, bottom: 20, right: 8)
        static let lineSpacing: CGFloat = 8
    }

    // MARK: - Properties

    var onPageSelect: Closure<PageModel>?

    // MARK: - Private Properties

    private weak var collectionView: UICollectionView?
    private var pages: [PageModel] = []

    // MARK: - Initialization

    init(collectionView: UICollectionView) {
        super.init()

        self.collectionView = collectionView
        configureCollectionView()
        configureCollectionViewLayout()
    }

    // MARK: - Methods

    func update(with pages: [PageModel]) {
        self.pages = pages
        collectionView?.reloadData()
    }

}

// MARK: - Configuration

private extension ChapterAdapter {

    func configureCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.registerNib(PageCollectionViewCell.self)
        collectionView?.clipsToBounds = false
        collectionView?.alwaysBounceVertical = true
    }

    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: appropriateCellWidth(), height: Constants.cellHeight)
        layout.sectionInset = Constants.sectionInset
        layout.minimumLineSpacing = Constants.lineSpacing
        layout.minimumInteritemSpacing = appropriateInterItemSpace()
        collectionView?.setCollectionViewLayout(layout, animated: false)
    }

}

// MARK: - UICollectionViewDataSource

extension ChapterAdapter: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return pages.count * 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(PageCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        let page = pages[indexPath.row % pages.count]
        cell.configure(with: page)
        return cell
    }

}

// MARK: - UICollectionViewDelegate

extension ChapterAdapter: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        onPageSelect?(pages[indexPath.row])
    }

}

// MARK: - Private Methods

private extension ChapterAdapter {

    func appropriateCellWidth() -> CGFloat {
        let fixedSpaces = [
            appropriateInterItemSpace(),
            Constants.sectionInset.left,
            Constants.sectionInset.right
        ].reduce(0, +)
        let availableWidth = UIScreen.main.bounds.width - fixedSpaces
        return availableWidth / 2
    }

    func appropriateInterItemSpace() -> CGFloat {
        return UIScreen.main.bounds.width.truncatingRemainder(dividingBy: 2)
    }

}
