//
//  PlaybookSnapshotsCache.swift
//  Pods
//
//  Created by Nikita Korobeinikov on 16.04.2025.
//

import UIKit
import Foundation

final class PlaybookSnapshotsCache {

    // MARK: - Snared

    static var shared = PlaybookSnapshotsCache()

    static let didUpdateNotification = Notification.Name("playbook-snapshots-updated")

    /// Поток для синхронизации изменения кэша
    private static let queue: DispatchQueue = .init(label: "PlaybookSnapshotsCache")

    // MARK: - Private Properties

    /// Кэш снапшотов
    private var snapshots: [String: UIImage?] = [:] {
        didSet {
            NotificationCenter.default.post(
                name: Self.didUpdateNotification,
                object: nil
            )
        }
    }

    // MARK: - Internal Methods

    func add(pages: [PlaybookPage]) {
        for page in pages {
            add(page: page)
        }
    }

    func add(page: PlaybookPage) {
        page.config(nil).makeSnapshot { snapshot in
            Self.queue.sync { [weak self] in
                self?.snapshots[page.snapshotKey] = snapshot
            }

        }
    }

    func get(page: PlaybookPage) -> UIImage? {
        snapshots[page.snapshotKey] ?? .init()
    }

}

// MARK: - Private Extensions

private extension PlaybookPage {

    var snapshotKey: String {
        "\(name)-\(description)"
    }

}
