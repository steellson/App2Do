//
//  AppRouter.swift
//
//  Created by Steellson


import UIKit


protocol AppRouterProtocol {
    var realmManager: RealmManager { get }
    func setupInitialView() -> UIViewController
}


//MARK: - AppRouterImpl

final class AppRouter: AppRouterProtocol {
    
    var realmManager: RealmManager = RealmManager()
    
    func setupInitialView() -> UIViewController {
        if realmManager.checkOnboarding() {
            return WelcomeViewController()
        } else {
            return TDViewController()
        }
    }
}
