// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mockia",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v5),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "Mockia",
            targets: ["Mockia"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Mockia",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "MockiaTests",
            dependencies: ["Mockia"]
        ),
    ]
)
