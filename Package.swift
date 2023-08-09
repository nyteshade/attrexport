// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "attrexport",
  platforms: [
    .macOS(.v13)
  ],
  dependencies: [
    .package(
      url: "https://github.com/nyteshade/AppleICNS.git",
      branch:"main"
    ),
    .package(
      url: "https://github.com/apple/swift-argument-parser",
      from: "1.2.2"
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "attrexport",
      dependencies: [
        // This is where you include the dependency in your target
        "AppleICNS",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ],
      path: "Sources"
    ),
  ]
)
