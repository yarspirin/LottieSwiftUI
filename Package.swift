// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LottieSwiftUI",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "LottieSwiftUI",
      targets: ["LottieSwiftUI"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0")
  ],
  targets: [
    .target(
      name: "LottieSwiftUI",
      dependencies: [.product(name: "Lottie", package: "lottie-spm")]
    ),
    .testTarget(
      name: "LottieSwiftUITests",
      dependencies: ["LottieSwiftUI", .product(name: "Lottie", package: "lottie-spm")]
    ),
  ]
)
