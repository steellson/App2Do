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
}
