//
//  TableViewCellContainer.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 27.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

typealias TableAdapter = UITableViewDataSource & UITableViewDelegate

public typealias PlaybookTableCell = UITableViewCell & PlaybookCellConfigurable

/// Реализация `PlaybookContainer`, для компонентов типа `UITableViewCell`.
///
/// - Note: Причина возникновения и проблема, которую решает контейнер,
/// а также решение описаны в
/// [источнике](https://osinski.dev/posts/snapshot-testing-self-sizing-table-view-cells/)
public class TableViewCellContainer<Cell: PlaybookTableCell>: UIView, TableAdapter {

    // MARK: - Nested Types

    /// Typealias на замыкание, при определении которого
    /// вы должны сконфигурировать ячейку необходимыми данными
    public typealias CellConfigurator = (_ cell: Cell, _ tableView: UITableView) -> Void
    /// Typealias на замыкание, в рамках которого вы должны посчитать и вернуть необходимую высоту ячейку,
    /// в зависимости от заданной ширины
    public typealias HeightResolver = (_ width: CGFloat) -> (CGFloat)

    // MARK: - Private Properties

    private let tableView = PlaybookTableView()
    private let configureCell: CellConfigurator
    private let width: CGFloat
    private let heightResolver: ((CGFloat) -> CGFloat)?

    // MARK: - Initialization

    /// Создание контейнера для ячеек внутри плейбука.
    ///
    /// - Parameters:
    ///   - width: Ширина ячейки
    ///   - registerType: Тип регистрации ячейки `CellRegisterType`
    ///   - configureCell: Замыкание, которое вызывается в методе `tableView:cellForRowAt:`,
    ///     позволяет сконфигурировать контент ячейки.
    ///   - heightResolver: Замыкание, которое вызывается в методе `tableView:heightForRowAt:`,
    ///     позволяет расчитать и вернуть высоту ячейки.
    ///     В случае передачи `nil` используется `UITableView.automaticDimension`.
    ///     По-умолчанию равно `nil`.
    public init(width: CGFloat,
                registerType: CellRegisterType = .nib,
                configureCell: @escaping CellConfigurator,
                heightResolver: HeightResolver? = nil) {
        self.configureCell = configureCell
        self.heightResolver = heightResolver
        self.width = width
        super.init(frame: .zero)

        tableView.backgroundColor = Colors.Main.background
        tableView.separatorStyle = .none
        tableView.contentInset = .zero
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self

        switch registerType {
        case .class:
            tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier())
        case .nib:
            tableView.registerNib(Cell.self, bundle: Cell.cellBundle() ?? Bundle.shared(for: Cell.self))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITableViewDataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(Cell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        configureCell(cell, tableView)
        return cell
    }

    // MARK: - UITableViewDelegate

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightResolver?(frame.width) ?? UITableView.automaticDimension
    }

}

// MARK: - PlaybookContainer

extension TableViewCellContainer: PlaybookContainer {

    public func loadView() -> UIView {
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

        return self
    }

}

/// Наследник `UITableView` для плейбука. Автоматически изменяет свой размер под contentSize.
private final class PlaybookTableView: UITableView {

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
