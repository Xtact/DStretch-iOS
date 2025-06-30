// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Dstretch-iOS",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Dstretch", targets: ["Dstretch"])
    ],
    targets: [
        .target(
            name: "Dstretch",
            path: ".",
            exclude: ["README.md", "codemagic.yaml", ".github"],
            sources: ["."],
            publicHeadersPath: ""
        ),
        .testTarget(
            name: "DstretchTests",
            dependencies: ["Dstretch"],
            path: "Tests"
        )
    ]
)
