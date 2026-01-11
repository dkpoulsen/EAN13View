// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "EAN13View",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "EAN13View",
            targets: ["EAN13View"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EAN13View",
            path: "EAN13View/Source",
            publicHeadersPath: ".."
        ),
    ]
)
