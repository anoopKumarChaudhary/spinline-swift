// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SpinlineEmbed",
    platforms: [.iOS(.v14), .macOS(.v12)],
    products: [
        .library(name: "SpinlineEmbed", targets: ["SpinlineEmbed"]),
    ],
    targets: [
        .target(name: "SpinlineEmbed", path: "Sources/SpinlineEmbed"),
        .testTarget(name: "SpinlineEmbedTests", dependencies: ["SpinlineEmbed"], path: "Tests/SpinlineEmbedTests"),
    ]
)
