//
//  SUIViewContainer.swift
//  Pods
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//

import UIKit
import SwiftUI

/// Реализация `PlaybookContainer`, для компонентов типа `SwiftUI.View`.
@available(iOS 13.0, *)
public class SUIViewContainer<View: SwiftUI.View>: UIView {

    // MARK: - Private Properties

    private weak var parent: UIViewController?

    private let viewFactory: () -> View
    private let width: CGFloat?
    private let height: CGFloat?

    // MARK: - Initialization

    /// Создание контейнера для  SwiftUI.View внутри плейбука.
    ///
    /// - Parameters:
    ///   - parent: Контроллер нужен, чтобы удерживать `UIHostingController`
    ///   - width: Предполагаемая ширины view,
    ///     при передаче nil - view будет растягиваться под размер собственного контента.
    ///   - height: Предполагаемая высота view,
    ///     при передаче nil - view будет растягиваться под размер собственного контента.
    ///   - viewFactory: замыкание для создания `View`, который требуется поместить в контейнер
    public init(parent: UIViewController?,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                _ viewFactory: @escaping () -> View) {
        self.viewFactory = viewFactory
        self.parent = parent
        self.width = width
        self.height = height
        super.init(frame: .zero)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - PlaybookContainer

@available(iOS 13.0, *)
extension SUIViewContainer: PlaybookContainer {

    public func loadView() -> UIView {
        guard
            let contentView = parent?.hostSwiftUIView(view: viewFactory()).view
        else {
            return self
        }

        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        if let width = width {
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: width)
            ])
        }

        if let height = height {
            NSLayoutConstraint.activate([
                contentView.heightAnchor.constraint(equalToConstant: height)
            ])
        }

        return self
    }

    public func makeSnapshot() -> UIImage? {
        if #available(iOS 16, *) {
            ImageRenderer(content: viewFactory().padding(12)).uiImage
        } else {
            loadView().snapshot()
        }
    }

}
