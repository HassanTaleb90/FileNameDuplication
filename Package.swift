// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FileNameDuplication",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FileNameDuplication",
            targets: ["FileNameDuplication"]),
    ],
    targets: [
        .target(
            name: "FileNameDuplication"),
        .testTarget(
            name: "FileNameDuplicationTests",
            dependencies: ["FileNameDuplication"]
        ),
    ]
)
