import SwiftUI
import FlowStacks

struct ThirdView: View {
    
    @EnvironmentObject var navigator: FlowNavigator<Screen>
    
    var body: some View {
        Text("Third View")
        Button("Close") {
            navigator.dismiss()
        }
    }
}

#Preview {
    ThirdView()
        .environmentObject(
            FlowNavigator(.constant([.root(Screen.general), .push(Screen.third)]))
        )
}
