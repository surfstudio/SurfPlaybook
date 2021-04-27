//
//  ViewContainer.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 27.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

public class ViewContainer<View: UIView>: UIView {

    // MARK: - Private Properties

    private let view: View

    // MARK: - Initialization

    /// Создание контейнера для обычных UIView внутри плейбука.
    ///
    /// - Parameters:
    ///   - view: экземпляр UIView или его наследник, который требуется поместить в контейнер
    ///   - width: Предполагаемая ширины view,
    ///     при передаче nil - view будет растягиваться под размер собственного контента.
    ///   - height: Предполагаемая высота view,
    ///     при передаче nil - view будет растягиваться под размер собственного контента.
    public init(_ view: View, width: CGFloat?, height: CGFloat?) {
        self.view = view
        super.init(frame: .zero)
        backgroundColor = Colors.Main.background

        translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        if let width = width {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: width)
            ])
        }

        if let height = height {
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: height)
            ])
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
