import PackagePlugin
import Foundation

@main
struct SwiftLintPlugin: BuildToolPlugin {
	var isPreview: Bool {
		ProcessInfo
			.processInfo
			.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
	}
	func createBuildCommands(
		context: PluginContext,
		target: Target
	) async throws -> [Command] {
		if isPreview {
			return []
		}
		return [
			.buildCommand(
				displayName: "Running SwiftLint for \(target.name)",
				executable: try context.tool(named: "swiftlint").path,
				arguments: [
					"lint",
					"--in-process-sourcekit",
					"--path",
					target.directory.string,
					"--config",
					"\(context.package.directory.string)/.swiftlint.yml"
				],
				environment: [:]
			)
		]
	}
}
