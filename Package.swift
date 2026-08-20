// swift-tools-version: 6.0
// Created by Sxnnyside Project on 30/01/26.

import PackageDescription

let package = Package(
    name: "SEISwift",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SEISwift",
            targets: ["SEISwift"]
        )
    ],
    targets: [
        .target(
            name: "SEISwift",
            resources: [
                .process("Resources")
            ],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "SEISwiftTests",
            dependencies: ["SEISwift"],
            swiftSettings: [.swiftLanguageMode(.v6)]
        )
    ]
)
