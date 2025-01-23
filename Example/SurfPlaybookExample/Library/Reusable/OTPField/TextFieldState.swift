//
//  TextFieldState.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SwiftUI

public enum TextFieldState {
    case normal
    case disabled
    case error

    static func getState(isEnabled: Bool, hasError: Bool) -> TextFieldState {
        if isEnabled {
            return hasError ? .error : .normal
        }
        return .disabled
    }
}

// MARK: - Color

@available(iOS 15.0, *)
extension Dictionary where Key == TextFieldState, Value == ColorAsset {

    func getColor(for state: TextFieldState) -> SwiftUI.Color? {
        let uiColor = self[state]?.color ?? self[.normal]?.color
        return .init(uiColor: uiColor ?? .clear)
    }

}

// MARK: - Environment

public enum TextFieldStateKey: EnvironmentKey {
    public static var defaultValue: TextFieldState = .normal
}

@available(iOS 13, *)
public extension EnvironmentValues {
    var textFieldState: TextFieldState {
        get { self[TextFieldStateKey.self] }
        set { self[TextFieldStateKey.self] = newValue }
    }
}
