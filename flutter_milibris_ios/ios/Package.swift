// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_milibris_ios",
    platforms: [
        .iOS("13.0"),
    ],
    products: [
        .library(name: "flutter-milibris-ios", targets: ["flutter_milibris_ios"])
    ],
    dependencies: [
            .package(
      url: "https://github.com/miLibris/ios-milibris-reader-sdk.git",
      branch: "main"
    ),
    ],
    targets: [
        .target(
            name: "flutter_milibris_ios",
            dependencies: [
                .product(name: "MiLibrisReaderSDK", package: "ios-milibris-reader-sdk"),
            ],
            resources: []
        )
    ]
)