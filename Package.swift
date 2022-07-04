// swift-tools-version: 5.6
import PackageDescription

let package = Package(
	name: "SwiftLintPlugin",
	platforms: [
		.iOS(.v14),
		.watchOS(.v7),
		.macOS(.v11),
		.tvOS(.v14),
	],
	products: [
		.plugin(
			name: "SwiftLintPlugin",
			targets: ["SwiftLintPlugin"]
		),
	],
	dependencies: [
	],
	targets: [
		.binaryTarget(
			name: "SwiftLintBinary",
			url: "https://github.com/realm/SwiftLint/releases/download/0.47.1/SwiftLintBinary-macos.artifactbundle.zip",
			checksum: "82ef90b7d76b02e41edd73423687d9cedf0bb9849dcbedad8df3a461e5a7b555"
		),
		.plugin(
			name: "SwiftLintPlugin",
			capability: .buildTool(),
			dependencies: [
				"SwiftLintBinary",
			]
		),
	]
)
