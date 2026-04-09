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
            .exact("0.2.1-SNAPSHOT-feature-gmms-15160-ios-pure-jfrog-7")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://purecloud.jfrog.io/purecloud/genesys-cloud-ios.dev/GenesysCloud/GenesysCloud-0.2.1-SNAPSHOT-feature-gmms-15160-ios-pure-jfrog-7.zip",
            checksum: "d6c493d3a4b2e0962dd8d31c97893b24ee417aba585460518c015e15cf7a055d"
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
