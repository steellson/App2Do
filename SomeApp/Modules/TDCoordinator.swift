//
//  TDCoordinator.swift
//
//  Created by Steellson
//

import UIKit

final class TDCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController = WelcomeViewController()
        
        viewController.viewModelBuilder = {
            TDViewModel(input: $0)
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
