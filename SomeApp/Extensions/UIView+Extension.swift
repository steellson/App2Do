//
//  UIView+Extension.swift
//  SomeApp
//
//  Created by Andrew Steellson on 24.05.2023.
//

import UIKit

extension UIView {
    
    // Pleasure setup
    func addNewSubbview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func makeShadow() {
        layer.shadowOpacity = 1
        layer.shadowColor   = R.Colors.shadowGrayColor.cgColor
        layer.shadowOffset  = .init(width: 5, height: 8)
        layer.shadowRadius = 0
    }
    
    func makeBorder(of width: CGFloat) {
        self.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.borderWidth = width
    }
}
