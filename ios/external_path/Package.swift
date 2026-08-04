// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "external_path",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "external-path", targets: ["external_path"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "external_path",
            dependencies: [
                .product(name: "Flutter", package: "Flutter")
            ],
            path: "Sources/external_path"
        )
    ]
)
