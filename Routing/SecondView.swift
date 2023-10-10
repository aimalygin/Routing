import SwiftUI
import FlowStacks

class SecondViewModel: ObservableObject {
    @Published var title: String = "Second View"
    @Published var buttonTitle: String = "Show Third View"
    
    var navigator: FlowNavigator<Screen>
    
    init(navigator: FlowNavigator<Screen>) {
        self.navigator = navigator
    }
    
    @MainActor
    func showThirdView() {
        navigator.presentSheet(.third)
    }
}

struct SecondView: View {
    
    @ObservedObject var viewModel: SecondViewModel
    
    var body: some View {
        Text(viewModel.title)
        Button(viewModel.buttonTitle) {
            viewModel.showThirdView()
        }
    }
}

#Preview {
    SecondView(viewModel: SecondViewModel(navigator: FlowNavigator(.constant([.root(Screen.general), .push(Screen.second)]))))
}
