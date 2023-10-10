import Foundation
import Swinject

class DependencyProvider {
    static let shared = DependencyProvider()
    
    let container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler(
            [
                MainAssembly()
            ],
            container: container
        )
    }
}
