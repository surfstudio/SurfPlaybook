//
//  DishCell.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import UIKit

public final class DishCell: UICollectionViewCell {

    // MARK: - Nested Types

    public struct Model {
        public let name: String
        public let price: String
        public let image: UIImage?
        public let isNew: Bool
    }

    // MARK: - Views

    private let nameLabel = UILabel()
    private let priceButton = CommonButton()
    private let iconView = UIImageView()
    private let infoLabel = UILabel()
    private let groupView = UIView()

    // TODO: - добавить вьюшки

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure

    public func configure(with model: Model) {
        iconView.image = model.image
        nameLabel.text = model.name
        priceButton.setTitle(model.price, for: .normal)
        infoLabel.isHidden = !model.isNew
        groupView.backgroundColor = model.isNew ? .black : .clear
        contentView.backgroundColor = model.isNew ? .orange : .black
    }
}

// MARK: - Private Methods

private extension DishCell {

    func customInit() {
        setupViews()
        setupStyle()
    }

    func setupViews() {
        contentView.addSubview(groupView)
        contentView.addSubview(infoLabel)

        groupView.addSubview(iconView)
        groupView.addSubview(nameLabel)
        groupView.addSubview(priceButton)

        groupView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            groupView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            groupView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            groupView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            groupView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22),

            infoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),

            iconView.heightAnchor.constraint(equalToConstant: 97),
            iconView.topAnchor.constraint(equalTo: groupView.topAnchor, constant: 16),
            iconView.leadingAnchor.constraint(equalTo: groupView.leadingAnchor, constant: 14),
            iconView.trailingAnchor.constraint(equalTo: groupView.trailingAnchor, constant: -14),

            nameLabel.centerXAnchor.constraint(equalTo: groupView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 8),

            priceButton.widthAnchor.constraint(equalTo: iconView.widthAnchor),
            priceButton.centerXAnchor.constraint(equalTo: groupView.centerXAnchor),
            priceButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            priceButton.bottomAnchor.constraint(equalTo: groupView.bottomAnchor, constant: -12),
            priceButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }

    func setupStyle() {
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 14)

        infoLabel.textColor = .white
        infoLabel.numberOfLines = 1
        infoLabel.textAlignment = .center
        infoLabel.font = .systemFont(ofSize: 12, weight: .bold)
        infoLabel.text = L10n.DishCellPreset.Small.Title.new

        priceButton.apply(style: .main)

        contentView.layer.cornerRadius = 18
        groupView.layer.cornerRadius = 16
    }

}
