import SwiftUI
import FlowStacks

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
