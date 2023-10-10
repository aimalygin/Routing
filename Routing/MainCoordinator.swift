import SwiftUI
import FlowStacks

enum Screen {
    case general
    case second
    case third
}

struct MainCoordinator: View {
    
    @State var routes: Routes<Screen> = [.root(.general, embedInNavigationView: true)]
    
    var body: some View {
        Router($routes) { screen, _ in
            switch screen {
            case .general:
                ContentView {
                    simulateDeeplink(animated: true)
                }
            case .second:
                SecondView()
            case .third:
                ThirdView()
            }
        }
    }
    
    private func simulateDeeplink(animated: Bool) {
        if animated {
            $routes.withDelaysIfUnsupported { routes in
                routes = [.root(.general, embedInNavigationView: true), .push(.second), .sheet(.third)]
            }
        } else {
            routes = [.root(.general, embedInNavigationView: true), .push(.second), .sheet(.third)]
        }
    }
}
