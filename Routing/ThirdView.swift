import SwiftUI
import FlowStacks

class ThirdViewModel: ObservableObject {
    @Published var title: String = "Third View"
    @Published var buttonTitle: String = "Close"
    
    var navigator: FlowNavigator<Screen>
    
    init(navigator: FlowNavigator<Screen>) {
        self.navigator = navigator
    }
    
    @MainActor
    func close() {
        navigator.dismiss()
    }
}

struct ThirdView: View {
    
    @ObservedObject var viewModel: ThirdViewModel
    
    var body: some View {
        Text(viewModel.title)
        Button(viewModel.buttonTitle) {
            viewModel.close()
        }
    }
}

#Preview {
    ThirdView(viewModel: ThirdViewModel(navigator: FlowNavigator(.constant([.root(Screen.general), .push(Screen.third)]))))
}
