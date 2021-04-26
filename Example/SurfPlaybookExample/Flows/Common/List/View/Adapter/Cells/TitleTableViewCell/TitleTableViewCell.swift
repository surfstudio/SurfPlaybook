//
//  TitleTableViewCell.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 26.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TitleTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with title: String) {
        titleLabel.text = title
        titleLabel.apply(style: .displayHeavy20Black)
    }

}

// MARK: - Appearance

private extension TitleTableViewCell {

    func configureAppearance() {
        selectionStyle = .none
        titleLabel.numberOfLines = 0
    }

}
