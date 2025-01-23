//
//  OTPFieldStyle.swift
//  SurfPlaybook
//
//  Created by Nikita Korobeinikov on 23.01.2025.
//  Copyright © 2025 Surf. All rights reserved.
//

import SwiftUI

@available(iOS 15, *)
public protocol OTPFieldStyle {

    associatedtype ItemView: View

    @ViewBuilder
    func makeItem(_ field: AnyView, for state: TextFieldState) -> ItemView
}

@available(iOS 15, *)
public enum OTPFieldStyleKey: EnvironmentKey {
    public static var defaultValue: any OTPFieldStyle = .rounded
}

@available(iOS 15, *)
public extension EnvironmentValues {
    var otpFieldStyle: any OTPFieldStyle {
        get { self[OTPFieldStyleKey.self] }
        set { self[OTPFieldStyleKey.self] = newValue }
    }
}
