import Foundation

protocol Coordinator {
    associatedtype Screen
    
    var navigator: Navigator<Screen> { get }
}
