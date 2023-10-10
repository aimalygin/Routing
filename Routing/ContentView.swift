import SwiftUI
import FlowStacks

protocol DataProviderProtocol {
    var title: String { get }
    var secondButtonTitle: String { get }
    var thirdButtonTitle: String { get }
}

struct DataProvider: DataProviderProtocol {
    var title: String = "Hello, world!"
    var secondButtonTitle: String = "Show Second View"
    var thirdButtonTitle: String = "Show Third View"
}

class ContentViewModel: ObservableObject {
    @Published var title: String
    @Published var secondButtonTitle: String
    @Published var thirdButtonTitle: String
    
    var navigator: FlowNavigator<Screen>    
    var simulateDeeplink: () -> Void
    
    convenience init(
        navigator: FlowNavigator<Screen>,
        dataProvider: DataProviderProtocol,
        simulateDeeplink: @escaping () -> Void
    ) {
        self.init(
            navigator: navigator,
            title: dataProvider.title,
            secondButtonTitle: dataProvider.secondButtonTitle,
            thirdButtonTitle: dataProvider.thirdButtonTitle,
            simulateDeeplink: simulateDeeplink
        )
    }
    
    private init(navigator: FlowNavigator<Screen>,
         title: String,
         secondButtonTitle: String,
         thirdButtonTitle: String,
         simulateDeeplink: @escaping () -> Void) {
        self.navigator = navigator
        self.title = title
        self.secondButtonTitle = secondButtonTitle
        self.thirdButtonTitle = thirdButtonTitle
        self.simulateDeeplink = simulateDeeplink
    }
    
    @MainActor func showSecondView() {
        navigator.push(.second)
    }
    
    @MainActor func showThirdView() {
        navigator.presentSheet(.third)
    }
}

struct ContentView: View {
        
    @ObservedObject var viewModel: ContentViewModel
        
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(viewModel.title)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                
                Button(viewModel.secondButtonTitle) {
                    viewModel.showSecondView()
                }
                Button(viewModel.thirdButtonTitle) {
                    viewModel.showThirdView()
                }
                
                Button("Simulate deeplink") {
                    viewModel.simulateDeeplink()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(
        viewModel: ContentViewModel(
            navigator: FlowNavigator(.constant([.root(Screen.general)])),
            dataProvider: DependencyProvider.shared.container.resolve(
                DataProviderProtocol.self
            )!,
            simulateDeeplink: {}
        )
    )
}
