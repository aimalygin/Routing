import Foundation
import Swinject

class MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataProviderProtocol.self) { _ in
            DataProvider()
        }.inObjectScope(.container)
        
        container.register(Navigator<Screen>.self) { _ in
            Navigator<Screen>(routes: [.root(Screen.general, embedInNavigationView: true)])
        }
        
        container.register(MainCoordinator.self) { resolver in
            let navigator = resolver.resolve(Navigator<Screen>.self)!
            return MainCoordinator(container: container, navigator: navigator)
        }
    }
}
