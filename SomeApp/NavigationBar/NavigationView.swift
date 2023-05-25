//
//  NavigationView.swift
//
//  Created by Steellson
//

import UIKit


final class NavigationView: BaseView {

}

//MARK: - NavigationView Extension

extension NavigationView {
    
    override func setupView() {
        super.setupView()
        
        layer.cornerRadius = 4
        
        makeBorder(of: 0.5)
        makeShadow(opacity: 1)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
    }
}
