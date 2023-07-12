//
//  Coordinator.swift
//
//  Created by Steellson.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    
    func start()
    func goMain()
}

extension CoordinatorProtocol {
    
    func add(coordinator: CoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}

//MARK: - AppCoordinatorImpl

class Coordinator: CoordinatorProtocol {
    
    var childCoordinators: [CoordinatorProtocol] = []

    func start() { fatalError("Childs should emplement Start function") }
    
    func goMain() { fatalError("Childs should emplement GoMain function") }
}
