//
//  PageCollectionViewCell.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class PageCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var snapshotImageView: UIImageView!
    @IBOutlet private weak var includePresetsImageView: UIImageView!

    // MARK: - UICollectionView

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configureShadow()
    }

    // MARK: - Methods

    func configure(with model: PageModel) {
        titleLabel.text = model.name
        titleLabel.apply(style: .textRegular14Black)
        includePresetsImageView.isHidden = model.playbookPage.presets.count <= 1

        guard let image = model.playbookPage.snapshot else {
            snapshotImageView.image = nil
            return
        }

        if
            image.size.width > snapshotImageView.bounds.size.width
                || image.size.height > snapshotImageView.bounds.size.height
        {
            snapshotImageView.contentMode = .scaleAspectFit
        } else {
            snapshotImageView.contentMode = .center
        }
        snapshotImageView.image = image
    }

}

// MARK: - Private Methods

private extension PageCollectionViewCell {

    func configureAppearance() {
        contentView.clipsToBounds = false
        contentView.backgroundColor = Colors.Main.background
        clipsToBounds = false
        backgroundColor = .clear

        snapshotImageView.contentMode = .scaleAspectFit
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = Colors.Main.background

        includePresetsImageView.contentMode = .scaleAspectFit
        includePresetsImageView.image = Resources.Assets.Icons.fire.image
    }

    func configureShadow() {
        containerView.layer.shadowColor = Colors.Main.shadow.cgColor
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = .init(width: 0, height: 2)
    }

}
