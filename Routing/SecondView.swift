import SwiftUI
import FlowStacks

struct SecondView: View {
    
    @EnvironmentObject var navigator: FlowNavigator<Screen>
    
    var body: some View {
        Text("Second View")
        Button("Show Third View") {
            navigator.presentSheet(.third)
        }
    }
}

#Preview {
    SecondView()
        .environmentObject(
            FlowNavigator(.constant([.root(Screen.general), .push(Screen.second)]))
        )
}
