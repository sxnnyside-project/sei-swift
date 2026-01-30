// swift-tools-version: 5.9
// Created by Sxnnyside Project on 30/01/26.

import PackageDescription

let package = Package(
    name: "SEISwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
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
            ]
        ),
        .testTarget(
            name: "SEISwiftTests",
            dependencies: ["SEISwift"]
        )
    ]
)
