// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenesysCloud",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GenesysCloud",
            targets: ["GenesysCloudWrapper"]),
    ],
    dependencies: [
        .package(
            name: "GenesysCloudMessenger",
            url: "https://github.com/MyPureCloud/mm-genesyscloudmessenger-spm-dev.git",
            .exact("1.19.0")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://genesysdx.jfrog.io/artifactory/genesys-cloud-ios.dev/GenesysCloud/GenesysCloud_version_1.19.0.rc3_commit_09cc38189a1bb32eea611b2d0f2b6464473a0fb6.zip",
            checksum: "554bd3a2f6f0d3e85bd3abbc45f5f1fea9d2e944df7a92bd273b947ed0a50b19"
        ),
        .target(
            name: "GenesysCloudWrapper",
            dependencies: [
                "GenesysCloud",
                .product(name: "GenesysCloudMessenger", package: "GenesysCloudMessenger")
            ]
        ),
        .testTarget(name: "PackageTests", dependencies: [
            "GenesysCloud"
        ])
    ]
)
