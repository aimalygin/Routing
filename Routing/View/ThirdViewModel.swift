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
