//
//  ListTableViewCell.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 26.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class ListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 0.25) {
            self.contentView.backgroundColor = highlighted ? Colors.Main.press : Colors.Main.background
        }
    }

    // MARK: - Methods

    func configure(with model: ListTableViewCellModel) {
        titleLabel.text = model.title
        titleLabel.apply(style: .textRegular16Black)

        subtitleLabel.text = model.subtitle
        subtitleLabel.apply(style: .textRegular13Gray)
        subtitleLabel.isHidden = model.subtitle == nil

        arrowImageView.isHidden = !model.showArrow
    }

}

// MARK: - Appearance

private extension ListTableViewCell {

    func configureAppearance() {
        selectionStyle = .none
        contentView.backgroundColor = Colors.Main.background

        titleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 0

        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.image = Resources.Assets.Icons.rightArrow.image
    }

}
