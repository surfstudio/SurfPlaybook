//
//  ChapterTableViewCell.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ChapterTableViewCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let itemSize: CGSize = .init(width: 168, height: 209)
        static let sectionInset: UIEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 8)
        static let interItemSpace: CGFloat = 0
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var showChapterButton: CommonButton!
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties

    var onPageSelect: Closure<PageModel>?
    var onChapterSelect: EmptyClosure?

    // MARK: - Private Properties

    private var pages: [PageModel] = []

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: ChapterModel) {
        titleLabel.text = model.name
        titleLabel.apply(style: .displayHeavy24Black)
        pages = model.pages
        collectionView.reloadData()
    }

}

// MARK: - Private Methods

private extension ChapterTableViewCell {

    func configureAppearance() {
        selectionStyle = .none
        contentView.backgroundColor = Colors.Main.background
        ocnfigureButton()
        configureCollectionView()
        configureCollectionViewLayout()
    }

    func ocnfigureButton() {
        let arrowImage = Resources.Assets.Icons.rightArrow.image.mask(with: Colors.Text.active)
        showChapterButton.semanticContentAttribute = .forceRightToLeft
        showChapterButton.setTitle(StringsConfig.showAllTitle, for: .normal)
        showChapterButton.setImage(arrowImage, for: .normal)
        showChapterButton.setImage(arrowImage.mask(with: 0.5), for: .highlighted)
        showChapterButton.apply(style: .textActive)
        showChapterButton.imageEdgeInsets = .init(top: 2, left: 0, bottom: 0, right: 0)
    }

    func configureCollectionView() {
        collectionView.backgroundColor = Colors.Main.background
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(PageCollectionViewCell.self)
        collectionView.clipsToBounds = false
        collectionView.alwaysBounceHorizontal = true
    }

    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Constants.itemSize
        layout.sectionInset = Constants.sectionInset
        layout.minimumLineSpacing = Constants.interItemSpace
        layout.minimumInteritemSpacing = 0
        collectionView?.setCollectionViewLayout(layout, animated: false)
    }

}

// MARK: - UICollectionViewDataSource

extension ChapterTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(PageCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        let page = pages[indexPath.row]
        cell.configure(with: page)
        return cell
    }

}

// MARK: - UICollectionViewDelegate

extension ChapterTableViewCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        onPageSelect?(pages[indexPath.row])
    }

}

// MARK: - Actions

private extension ChapterTableViewCell {

    @IBAction func openChapter(_ sender: Any) {
        onChapterSelect?()
    }

}
