import SwiftUI
import FlowStacks

enum Screen {
    case general
    case second
    case third
}

struct MainCoordinator: View, Coordinator {
    
    @StateObject var navigator = Navigator<Screen>(routes: [.root(.general, embedInNavigationView: true)])
        
    var body: some View {
        Router($navigator.routes) { screen, _ in
            switch screen {
            case .general:
                let viewModel = ContentViewModel(navigator: navigator.flowNavigator) {
                    simulateDeeplink(animated: false)
                }
                ContentView(viewModel: viewModel)
            case .second:
                let viewModel = SecondViewModel(navigator: navigator.flowNavigator)
                SecondView(viewModel: viewModel)
            case .third:
                let viewModel = ThirdViewModel(navigator: navigator.flowNavigator)
                ThirdView(viewModel: viewModel)
            }
        }
    }
    
    private func simulateDeeplink(animated: Bool) {
        if animated {
            $navigator.routes.withDelaysIfUnsupported { routes in
                routes = [.root(.general, embedInNavigationView: true), .push(.second), .sheet(.third)]
            }
        } else {
            navigator.routes = [.root(.general, embedInNavigationView: true), .push(.second), .sheet(.third)]
        }
    }
}
