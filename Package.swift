// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoaMQTT",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "CocoaMQTT", targets: ["CocoaMQTT"])
    ],
    dependencies: [
        .package(url: "https://github.com/leeway1208/MqttCocoaAsyncSocket", from: "1.0.8"),
        // SwiftLint command plugin used by CI/local lint commands only.
        // We do not attach it as a build tool plugin to avoid affecting build outputs.
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.63.2"),
    ],
    targets: [
        .target(
            name: "CocoaMQTT",
            dependencies: ["MqttCocoaAsyncSocket"],
            path: "Source",
            exclude: [
                "CocoaMQTTWebSocket.swift",
                "Info.plist",
                "PrivacyInfo.xcprivacy",
            ],
            swiftSettings: [.define("IS_SWIFT_PACKAGE")]
        ),
        .testTarget(
            name: "CocoaMQTTTests",
            dependencies: ["CocoaMQTT"],
            path: "CocoaMQTTTests",
            swiftSettings: [.define("IS_SWIFT_PACKAGE")]
        )
    ]
)
