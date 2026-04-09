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
            .exact("0.2.1-SNAPSHOT-feature-gmms-15160-ios-pure-jfrog-6")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://purecloud.jfrog.io/purecloud/genesys-cloud-ios.dev/GenesysCloud/GenesysCloud-0.2.1-SNAPSHOT-feature-gmms-15160-ios-pure-jfrog-6.zip",
            checksum: "01906147862019bc36439dd925dc244783b7cefbce97a658d6895420901b637a"
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
