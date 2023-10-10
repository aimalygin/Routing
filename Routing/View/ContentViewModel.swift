import SwiftUI
import FlowStacks

class ContentViewModel: ObservableObject {
    @Published var title: String
    @Published var secondButtonTitle: String
    @Published var thirdButtonTitle: String
    
    var navigator: FlowNavigator<Screen>
    var simulateDeeplink: () -> Void
    
    convenience init(
        navigator: FlowNavigator<Screen>,
        dataProvider: DataProviderProtocol,
        simulateDeeplink: @escaping () -> Void
    ) {
        self.init(
            navigator: navigator,
            title: dataProvider.title,
            secondButtonTitle: dataProvider.secondButtonTitle,
            thirdButtonTitle: dataProvider.thirdButtonTitle,
            simulateDeeplink: simulateDeeplink
        )
    }
    
    private init(navigator: FlowNavigator<Screen>,
         title: String,
         secondButtonTitle: String,
         thirdButtonTitle: String,
         simulateDeeplink: @escaping () -> Void) {
        self.navigator = navigator
        self.title = title
        self.secondButtonTitle = secondButtonTitle
        self.thirdButtonTitle = thirdButtonTitle
        self.simulateDeeplink = simulateDeeplink
    }
    
    @MainActor
    func showSecondView() {
        navigator.push(.second)
    }
    
    @MainActor
    func showThirdView() {
        navigator.presentSheet(.third)
    }
}
