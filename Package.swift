// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Dstretch",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Dstretch",
            targets: ["Dstretch"]
        ),
    ],
    targets: [
        .target(
            name: "Dstretch",
            dependencies: []
        ),
        .testTarget(
            name: "DstretchTests",
            dependencies: ["Dstretch"]
        ),
    ]
)
