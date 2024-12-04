// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Digest",
    platforms: [
        .macOS(.v10_13), .macCatalyst(.v13), .iOS(.v11), .tvOS(.v11), .watchOS(.v4), .visionOS(.v1)
    ],
    products: [
        .library(name: "Digest", targets: ["Digest"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "Digest", dependencies: [], resources: [.copy("PrivacyInfo.xcprivacy")]),
        .testTarget(name: "DigestTests", dependencies: ["Digest"]),
    ]
)
