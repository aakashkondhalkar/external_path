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
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "external_path",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/external_path"
        )
    ]
)
