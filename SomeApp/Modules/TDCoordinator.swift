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
        let realmManager = RealmManager()
        let dateService: DateServiceProtocol = DateService()
        let viewModel: (any TDViewModelTypeProtocol)? = TDViewModel(coordinator: self,
                                                         realmManager: realmManager,
                                                         dateService: dateService)
        viewController.viewModel = viewModel as? TDViewModel
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    override func goMain() {
        let viewController = TDViewController()
        let realmManager = RealmManager()
        let dateService: DateServiceProtocol = DateService()
        let viewModel: (any TDViewModelTypeProtocol)? = TDViewModel(coordinator: self,
                                                                    realmManager: realmManager,
                                                                    dateService: dateService)
        viewController.viewModel = viewModel as? TDViewModel
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
    }
}
