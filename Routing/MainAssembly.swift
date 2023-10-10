import Foundation
import Swinject

class MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataProviderProtocol.self) { _ in
            DataProvider()
        }.inObjectScope(.container)
    }
}
