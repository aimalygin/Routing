import SwiftUI
import FlowStacks

class Navigator<Screen>: ObservableObject {
    
    @Published var routes: Routes<Screen>
    
    init(routes: Routes<Screen>) {
        self.routes = routes
    }
    
    @MainActor
    lazy var flowNavigator: FlowNavigator<Screen> = {
        let binding = Binding(
            get: { [unowned self] in
                self.routes
            }, set: { [unowned self] in
                self.routes = $0
            })
        return FlowNavigator(binding)
    }()
}
