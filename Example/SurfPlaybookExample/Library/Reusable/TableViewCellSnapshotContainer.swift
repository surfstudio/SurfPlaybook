//
//  TableViewCellSnapshotContainer.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class TableViewCellSnapshotContainer<Cell: UITableViewCell>: UIView, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Nested Types

    typealias CellConfigurator = (_ cell: Cell, _ tableView: UITableView) -> Void
    typealias HeightResolver = (_ width: CGFloat) -> (CGFloat)

    // MARK: - Private Properties

    private let tableView = SnapshotTableView()
    private let configureCell: (Cell, UITableView) -> Void
    private let heightForWidth: ((CGFloat) -> CGFloat)?

    // MARK: - Initialization

    /// Создание контейнера для снепшот-тестов ячеек.
    ///
    /// - Parameters:
    ///   - width: Ширина ячейки
    ///   - configureCell: Замыкание, которое вызывается в методе `tableView:cellForRowAt:`,
    ///     позволяет сконфигурировать контент ячейки.
    ///   - heightForWidth: Замыкание, которое вызывается в методе `tableView:heightForRowAt:`,
    ///     позволяет расчитать и вернуть высоту ячейки.
    ///     В случае передачи `nil` используется `UITableView.automaticDimension`.
    ///     По-умолчанию равно `nil`.
    init(width: CGFloat, configureCell: @escaping CellConfigurator, heightForWidth: HeightResolver? = nil) {
        self.configureCell = configureCell
        self.heightForWidth = heightForWidth
        super.init(frame: .zero)

        tableView.separatorStyle = .none
        tableView.contentInset = .zero
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(Cell.self)

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 1.0)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(Cell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        configureCell(cell, tableView)
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForWidth?(frame.width) ?? UITableView.automaticDimension
    }

}

/// Наследник `UITableView` для снепшот тестов. Автоматически изменяет свой размер под contentSize.
final class SnapshotTableView: UITableView {

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
