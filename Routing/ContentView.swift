import SwiftUI
import FlowStacks

class ContentViewModel: ObservableObject {
    @Published var title: String = "Hello, world!"
    @Published var secondButtonTitle: String = "Show Second View"
    @Published var thirdButtonTitle: String = "Show Third View"
    
    var navigator: FlowNavigator<Screen>
    
    var simulateDeeplink: () -> Void
    
    init(navigator: FlowNavigator<Screen>, simulateDeeplink: @escaping () -> Void) {
        self.navigator = navigator
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
    ContentView(viewModel: ContentViewModel(navigator: FlowNavigator(.constant([.root(Screen.general)])), simulateDeeplink: {}))
}
