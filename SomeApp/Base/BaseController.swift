//  BaseController.swift
//
//  Created by Steellson
//


import UIKit

class BaseController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavBar()
        setupLayout()
    }
    
}

//MARK: BaseController Methods Extension

@objc extension BaseController {
    
     func setupView() {
         view.backgroundColor = R.Colors.mainBackgroundColor
     }
    
     func setupNavBar() { }
    
     func setupLayout() { }
}
