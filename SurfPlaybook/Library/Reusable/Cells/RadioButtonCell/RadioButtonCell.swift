//
//  RadioButtonCell.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class RadioButtonCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override public func setHighlighted(_ highlighted: Bool, animated: Bool) {
        UIView.animate(withDuration: AnimationTime.default) {
            self.contentView.backgroundColor = highlighted ? Colors.Main.press : Colors.Main.background
        }
    }

    // MARK: - Methods

    func configure(with model: RadioButtonCellModel) {
        titleLabel.text = model.title
        titleLabel.apply(style: .textRegular16Black)

        let image = model.isSelected
            ? Resources.Assets.Icons.radioOn.image
            : Resources.Assets.Icons.radioOff.image
        iconImageView.image = image
    }

}

// MARK: - Appearance

private extension RadioButtonCell {

    func configureAppearance() {
        selectionStyle = .none
        iconImageView.contentMode = .scaleAspectFit
        titleLabel.numberOfLines = 0
    }

}
