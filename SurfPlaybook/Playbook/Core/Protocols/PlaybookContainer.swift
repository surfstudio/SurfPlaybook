//
//  PlaybookContainer.swift
//  Pods
//
//  Created by Nikita Korobeinikov on 24.01.2025.
//

import Foundation
import UIKit

public typealias PlaybookContainerProvider = (UIViewController?) -> PlaybookContainer

/// Вспомогательный контейнер, который позволяет
///  - настроить вьюшку для показа на деталке страницы `PageViewController`
///  - подготовить снимок для отображения в карточках на главном `MainViewController`
///  - подготовить снимок для отображения в карточках на экране главы `ChapterViewController`
public protocol PlaybookContainer where Self: UIView {

    /// Настраивает и размещает вьюшку внутри контейнера
    @discardableResult
    func loadView() -> UIView
    /// Делает снимок вьюшки для отображения превьюшек
    /// - Note: Перед снимком вызывает `loadView`
    func makeSnapshot(with completion: @escaping (UIImage?) -> Void)

}

// MARK: - Defaults

public extension PlaybookContainer {

    func makeSnapshot(with completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.main.async { [completion] in
            self.loadView().layoutIfNeeded()
            completion(self.snapshot())
        }
    }

}
