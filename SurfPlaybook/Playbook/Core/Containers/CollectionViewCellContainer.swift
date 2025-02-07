//
//  CollectionViewCellContainer.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//

import UIKit

typealias CollectionAdapter = UICollectionViewDelegate & UICollectionViewDataSource

public typealias PlaybookCollectionCell = UICollectionViewCell & PlaybookCellConfigurable

/// Вспомогательный контейнер-коллекция, позвооляет обернуть UI-компонент типа UICollectionViewCell
/// в таблицу, чтобы показать его в рамках playbook-а.
///
/// - Reference:
///     Причина возникновения и проблема, которую решает контейнер,
///     а также решение описаны в [источнике](https://osinski.dev/posts/snapshot-testing-self-sizing-table-view-cells/)
@available(iOS 13.0, *)
public class CollectionViewCellContainer<Cell: PlaybookCollectionCell>: UIView, CollectionAdapter {

    // MARK: - Nested Types

    /// Typealias на замыкание, при определении которого
    /// вы должны сконфигурировать ячейку необходимыми данными
    public typealias CellConfigurator = (_ cell: Cell, _ tableView: UICollectionView) -> Void

    // MARK: - Private Properties

    private lazy var collectionView = PlaybookCollectionView(
        frame: .init(origin: .zero,
                     size: .init(width: UIScreen.main.bounds.width, height: containerHeight)),
        collectionViewLayout: makeCompositionalLayout()
    )

    private let configureCell: CellConfigurator
    private let itemSize: NSCollectionLayoutSize
    private let containerHeight: CGFloat

    // MARK: - Initialization

    /// Создание контейнера для ячеек внутри плейбука.
    ///
    /// - Parameters:
    ///   - itemSize: Размер ячейки для `UICompositionalLayout`
    ///   - containerHeight: Высота всего контейнера.
    ///   Должна быть чуть больше ожидаемой высоты ячейки, чтобы не испортить снапшот.
    ///   - registerType: Тип регистрации ячейки  `CellRegisterType`
    ///   - configureCell: Замыкание, которое вызывается в методе `collectionView:cellForItemAt:`
    ///   , позволяет сконфигурировать контент ячейки.
    public init(itemSize: NSCollectionLayoutSize,
                containerHeight: CGFloat,
                registerType: CellRegisterType = .nib,
                configureCell: @escaping CellConfigurator) {
        self.containerHeight = containerHeight
        self.itemSize = itemSize
        self.configureCell = configureCell
        super.init(frame: .zero)

        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self

        switch registerType {
        case .class:
            collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier())
        case .nib:
            collectionView.registerNib(Cell.self, bundle: Cell.cellBundle() ?? Bundle.shared(for: Cell.self))
        }

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: containerHeight),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 1.0)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UICollectionViewDataSource

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(Cell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        configureCell(cell, collectionView)
        return cell
    }

}

// MARK: - UICollectionViewCompositionalLayoutDelegate

@available(iOS 13.0, *)
extension CollectionViewCellContainer: UICollectionViewCompositionalLayoutDelegate {

    public func sectionProvider(for section: Int) -> NSCollectionLayoutSection? {
        // Item
        let item = makeItem()

        // Для центрирования ячейки по центру
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .flexible(0),
            top: nil,
            trailing: .flexible(0),
            bottom: nil
        )

        // Main Group
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)),
                                                           subitems: [item])
        // Section
        let section = NSCollectionLayoutSection(group: nestedGroup)

        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }

    func makeItem() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }

}

/// Наследник `UICollectionView` для плейбука. Автоматически изменяет свой размер под contentSize.
private final class PlaybookCollectionView: UICollectionView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}
