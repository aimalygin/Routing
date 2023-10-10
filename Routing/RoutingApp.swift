import SwiftUI
import FlowStacks

@main
struct RoutingApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinator(dependencyProvider: DependencyProvider.shared)
        }
    }
}
