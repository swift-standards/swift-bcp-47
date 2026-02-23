// swift-tools-version:6.2
import PackageDescription



extension String {
    static let bcp47: Self = "BCP 47"
    static let bcp47Tests: Self = bcp47 + " Tests"

    static let rfc5646: Self = "RFC 5646"
    static let standards: Self = "Standards"
    static let standardsTestSupport: Self = standards + "TestSupport"

    var tests: Self { self + " Tests" }
}

extension PackageDescription.Target.Dependency {
    static let rfc5646: Self = .product(name: "RFC 5646", package: "swift-rfc-5646")
    static let standards: Self = .product(name: "Standard Library Extensions", package: "swift-standard-library-extensions")
    static let standardsTestSupport: Self = .product(name: "Test Primitives", package: "swift-test-primitives")

    static let bcp47: Self = .target(name: .bcp47)
}

let package = Package(
    name: "swift-bcp-47",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(name: "BCP 47", targets: ["BCP 47"])
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-standard-library-extensions"),
        .package(path: "../swift-rfc-5646")
    ],
    targets: [
        .target(
            name: "BCP 47",
            dependencies: [
                .standards,
                .rfc5646
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
