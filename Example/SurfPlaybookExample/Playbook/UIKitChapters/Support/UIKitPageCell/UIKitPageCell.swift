//
//  UIKItPageCell.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class UIKitPageCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: UIKitPageCellModel) {
        titleLabel.text = model.text
        titleLabel.textColor = model.textColor ?? Colors.Text.main
        backgroundColor = model.backgroundColor ?? Colors.Main.background
    }

}

// MARK: - Appearance

private extension UIKitPageCell {

    func configureAppearance() {
        selectionStyle = .none
        titleLabel.numberOfLines = 0
        titleLabel.font = FontFamily.SFProText.regular.font(size: 16)
    }

}
