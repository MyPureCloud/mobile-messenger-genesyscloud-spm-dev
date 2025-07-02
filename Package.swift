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
            .exact("1.15.0")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://genesysdx.jfrog.io/artifactory/genesys-cloud-ios.dev/GenesysCloud/GenesysCloud_version_t1.15.0.rc28_commit_0649849deaca27b04e2d0237cb1ebd30d9146ebd.zip",
            checksum: "6f3ccb6df213770636639d53154e39d30371f9d7443ed8b248968f913cde52c1"
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
