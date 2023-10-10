import SwiftUI
import FlowStacks

@main
struct RoutingApp: App {
    var body: some Scene {
        WindowGroup {
            DependencyProvider.shared.container.resolve(MainCoordinator.self)!
        }
    }
}
