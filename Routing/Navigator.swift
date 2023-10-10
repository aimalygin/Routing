import SwiftUI
import FlowStacks

class Navigator<Screen>: ObservableObject {
    
    @Published var routes: Routes<Screen>
    
    init(routes: Routes<Screen>) {
        self.routes = routes
    }
    
    @MainActor
    var flowNavigator: FlowNavigator<Screen> {
        let binding = Binding(
            get: {
                self.routes
            }, set: {
                self.routes = $0
            })
        return FlowNavigator(binding)
    }
}
