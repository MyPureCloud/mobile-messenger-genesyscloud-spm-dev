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
            .exact("1.20.0")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://genesysdx.jfrog.io/artifactory/genesys-cloud-ios.dev/GenesysCloud/GenesysCloud_version_1.20.0.rc19_commit_118ae5a41ccc6e176ac939c23426b8286c19f5f9.zip",
            checksum: "1b76d597a4a132b65b74c21cf82f93523e3a13b7770a9253c8a77ac327241af6"
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
