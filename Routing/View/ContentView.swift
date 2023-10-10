import SwiftUI
import FlowStacks

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
