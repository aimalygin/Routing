import SwiftUI
import FlowStacks

struct ContentView: View {
    
    var simulateDeeplink: () -> Void
    
    @EnvironmentObject var navigator: FlowNavigator<Screen>
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                
                Button("Show Second View") {
                    navigator.push(.second)
                }
                Button("Show Third View") {
                    navigator.presentSheet(.third)
                }
                
                Button("Simulate deeplink") {
                    simulateDeeplink()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(simulateDeeplink: {})
        .environmentObject(FlowNavigator(.constant([.root(Screen.general)])))
}
