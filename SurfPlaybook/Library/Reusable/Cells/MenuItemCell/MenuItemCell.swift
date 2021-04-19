//
//  MenuItemCell.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class MenuItemCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    @IBOutlet private weak var separatorView: UIView!

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - UITableViewCell

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        UIView.animate(withDuration: AnimationTime.default) {
            let color = highlighted ? Colors.Main.press : Colors.Main.background
            self.contentView.backgroundColor = color
        }
    }

    // MARK: - Methods

    func configure(with model: MenuItemCellModel) {
        titleLabel.text = model.text
        titleLabel.apply(style: .textRegular16Black)
    }

}

// MARK: - Appearance

private extension MenuItemCell {

    func configureAppearance() {
        selectionStyle = .none
        configureLabel()
        configureArrow()
        configureSeparator()
    }

    func configureLabel() {
        titleLabel.numberOfLines = 0
    }

    func configureArrow() {
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.image = Resources.Assets.Icons.rightArrow.image
    }

    func configureSeparator() {
        separatorView.backgroundColor = Colors.Main.separator
    }

}
