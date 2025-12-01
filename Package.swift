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
    static let standards: Self = .product(name: "Standards", package: "swift-standards")
    static let standardsTestSupport: Self = .product(name: "StandardsTestSupport", package: "swift-standards")

    static let bcp47: Self = .target(name: .bcp47)
}

let package = Package(
    name: "swift-bcp-47",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11)
    ],
    products: [
        .library(name: .bcp47, targets: [.bcp47])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.8.0"),
        .package(url: "https://github.com/swift-standards/swift-rfc-5646", from: "0.1.0")
    ],
    targets: [
        .target(
            name: .bcp47,
            dependencies: [
                .standards,
                .rfc5646
            ]
        ),
        .testTarget(
            name: .bcp47Tests,
            dependencies: [
                .bcp47,
                .standardsTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
