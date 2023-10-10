import SwiftUI
import FlowStacks

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
