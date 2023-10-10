import SwiftUI
import FlowStacks

enum Screen {
    case general
    case second
    case third
}

struct MainCoordinator: View, Coordinator {
    let dependencyProvider: DependencyProvider
    @StateObject var navigator = Navigator<Screen>(routes: [.root(.general, embedInNavigationView: true)])
        
    var body: some View {
        Router($navigator.routes) { screen, _ in
            switch screen {
            case .general:
                contentView
            case .second:
                secondView
            case .third:
                thirdView
            }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        let dataProvider = dependencyProvider.container.resolve(DataProviderProtocol.self)!
        let viewModel = ContentViewModel(
            navigator: navigator.flowNavigator,
            dataProvider: dataProvider) {
                simulateDeeplink(animated: false)
            }
        ContentView(viewModel: viewModel)
    }
    
    @ViewBuilder
    var secondView: some View {
        let viewModel = SecondViewModel(navigator: navigator.flowNavigator)
        SecondView(viewModel: viewModel)
    }
    
    @ViewBuilder
    var thirdView: some View {
        let viewModel = ThirdViewModel(navigator: navigator.flowNavigator)
        ThirdView(viewModel: viewModel)
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
