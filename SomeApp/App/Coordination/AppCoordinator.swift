//
//  AppCoordinator.swift
//
//  Created by Steellson
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    private let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let tdCoordinator = TDCoordinator(navigationController: navigationController)
        self.add(coordinator: tdCoordinator)
        tdCoordinator.start()
    }
}
