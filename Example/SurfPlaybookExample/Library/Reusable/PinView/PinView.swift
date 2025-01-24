//
//  PinView.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct PinView: View {

    // MARK: - Metrics

    @ScaledMetric var width: CGFloat = 24

    // MARK: - States

    @State private var selectedIndex: Int = -1
    @State private var count: Int

    // MARK: - Properties

    private let shakeDuration: TimeInterval = 0.25

    // MARK: - Init

    /// - Parameters:
    ///  - count: Количество пинов
    public init(count: UInt) {
        self.count = Int(count)
    }

    // MARK: - Body

    public var body: some View {
        ForEach(0..<count, id: \.self) { index in
            Button(action: {
                selectedIndex = index
                DispatchQueue.main.asyncAfter(deadline: .now() + shakeDuration) {
                    selectedIndex = -1
                }
            }, label: {
                Circle()
                    .fill(Color(uiColor: Colors.Main.active))
                    .frame(width: width, height: width)
                    .shake(isShaking: $selectedIndex.whenEqual(index),
                           duration: shakeDuration)
            })
        }
    }

}
