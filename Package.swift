// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SurfPlaybook",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "SurfPlaybook",
            targets: ["SurfPlaybook"])
    ],
    targets: [
        .target(
            name: "SurfPlaybook",
            path: "SurfPlaybook",
            exclude: [
                "Info.plist"
            ]
        )
    ]
)
