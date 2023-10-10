import SwiftUI
import FlowStacks
import Swinject

enum Screen {
    case general
    case second
    case third
}

struct MainCoordinator: View, Coordinator {
    let container: Container
    @StateObject var navigator: Navigator<Screen>
    
    init(
        container: Container,
        navigator: Navigator<Screen> = Navigator<Screen>(routes: [.root(.general, embedInNavigationView: true)])
    ) {
        self.container = container
        _navigator = StateObject(wrappedValue: navigator)
    }
        
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
    @MainActor
    var contentView: some View {
        let dataProvider = container.resolve(DataProviderProtocol.self)!
        let viewModel = ContentViewModel(
            navigator: navigator.flowNavigator,
            dataProvider: dataProvider) {
                self.simulateDeeplink(animated: false)
            }
        ContentView(viewModel: viewModel)
    }
    
    @ViewBuilder
    @MainActor
    var secondView: some View {
        let viewModel = SecondViewModel(navigator: navigator.flowNavigator)
        SecondView(viewModel: viewModel)
    }
    
    @ViewBuilder
    @MainActor
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
