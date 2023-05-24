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
         view.backgroundColor = UIColor(red: 164/255, green: 211/255, blue: 121/255, alpha: 1)
     }
    
     func setupNavBar() { }
    
     func setupLayout() { }
}
