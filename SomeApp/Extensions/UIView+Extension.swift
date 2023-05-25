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
    
    func makeShadow(opacity: Float) {
        layer.shadowOpacity = opacity
        layer.shadowColor   = .init(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOffset  = .init(width: 3, height: 5)
    }
    
    func makeBorder(of width: CGFloat) {
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = width
    }
}
