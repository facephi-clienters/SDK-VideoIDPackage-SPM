// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDK-VideoIDPackage-SPM",
    defaultLocalization: "es",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SDK-VideoIDPackage-SPM",
            targets: ["SDK-VideoIDPackage-SPM", "videoidComponent"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/AgoraIO/AgoraLite_iOS.git", .upToNextMinor(from: "4.5.3")),
        .package(url: "https://github.com/daltoniam/Starscream.git", .upToNextMinor(from: "4.0.8")),
        .package(url: "https://github.com/facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.10.0")),
        .package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMinor(from: "4.4.0")),
        .package(url: "https://github.com/facephi-clienters/FPHISelphidDocumentReaderBundle-SPM.git", .upToNextMinor(from: "3.1.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SDK-VideoIDPackage-SPM",
            dependencies: [
                "videoidComponent",
                "SDK-CorePackage-SPM",
                .product(
                    name: "RtcBasic",
                    package: "AgoraLite_iOS"),
                .product(
                    name: "Starscream",
                    package: "Starscream"),
                .product(
                    name: "Lottie",
                    package: "lottie-spm"),
                .product(
                    name: "FPHISelphidDocumentReaderBundle-SPM",
                    package: "FPHISelphidDocumentReaderBundle-SPM"),
            ]
        ),
        .binaryTarget(name: "videoidComponent",
        url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/SDK/FPHISDKVideoIDComponent/2.10.0/videoidComponent.zip",
        checksum: "efa6b0dba0a2ac81ed4db26b2270a9fe785a0dca7427d9e77db6d6a0927708c2"),
    ]
)
