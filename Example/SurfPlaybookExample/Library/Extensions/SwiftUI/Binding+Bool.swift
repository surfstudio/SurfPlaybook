//
//  Binding+Bool.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 24.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension Binding where Value == Bool {
    init(binding: Binding<(some Any)?>) {
        self.init(
            get: {
                binding.wrappedValue != nil
            },
            set: { newValue in
                guard newValue == false else {
                    return
                }
                binding.wrappedValue = nil
            }
        )
    }
}

@available(iOS 13.0, *)
extension Binding {
    /// Трансформирует binding с опциональным значением в `Binding<Bool>`.
    func mapToBool<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
        Binding<Bool>(binding: self)
    }
}

@available(iOS 13.0, *)
extension Binding where Value: Equatable {

    /// Создает binding, который `true` при равенстве значения с переданным.
    /// - parameter value: Значение, с которым сравнивается текущее `wrappedValue`.
    func whenEqual(_ value: Value) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue == value },
            set: { self.wrappedValue = $0 ? value : self.wrappedValue }
        )
    }

}
