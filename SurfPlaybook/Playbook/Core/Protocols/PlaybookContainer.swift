//
//  PlaybookContainer.swift
//  Pods
//
//  Created by Nikita Korobeinikov on 24.01.2025.
//

import UIKit

public typealias PlaybookContainerProvider = (UIViewController?) -> PlaybookContainer

/// Контейнер для обертки вьюшек разных типов
public protocol PlaybookContainer where Self: UIView {

    /// Загружает и размещает вьюшку
    @discardableResult
    func loadView() -> UIView
    /// Делает снимок вьюшки для отображения превьюшек
    func makeSnapshot() -> UIImage?

}

// MARK: - Defaults

public extension PlaybookContainer {

    func makeSnapshot() -> UIImage? {
        loadView().layoutIfNeeded()
        return snapshot()
    }

}
