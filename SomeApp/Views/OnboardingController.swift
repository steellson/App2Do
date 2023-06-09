//
//  OnboardingController.swift
//
//  Created by Steellson


import UIKit

final class OnboardingController: BaseController {
    
    private let welcomeView = WelcomeViewController()
    private let mainView = TDViewController()
    
    private var window: UIWindow
    
    var isOnboarded = false
    
    init(window: UIWindow) {
        self.window = window
        super.init(nibName: nil, bundle: nil)
        
        selectView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func selectView() {
        if isOnboarded {
            window.rootViewController = mainView
        } else {
            window.rootViewController = welcomeView
        }
    }
}
