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
