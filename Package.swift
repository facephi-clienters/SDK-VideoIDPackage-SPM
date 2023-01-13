// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDK-VideoIDPackage-SPM",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SDK-VideoIDPackage-SPM",
            targets: ["SDK-VideoIDPackage-SPM", "videoid_component"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS", from: "3.4.3"),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.4"),
       .package(name: "SDK-CorePackage-SPM", url: "https://github.com/facephi-clienters/SDK-CorePackage-SPM.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SDK-VideoIDPackage-SPM",
            dependencies: ["videoid_component", "SDK-CorePackage-SPM", .product(
                name: "RtcBasic",
                package: "AgoraRtcEngine_iOS"), .product(
                    name: "Starscream",
                    package: "Starscream"),
            ],
            resources: [.process("Resources")]
        ),
        .binaryTarget(name: "videoid_component", path: "videoid_component.xcframework"),
    ]
)
