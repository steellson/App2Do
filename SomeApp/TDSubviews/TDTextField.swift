//
//  TDTextField.swift
//
//  Created by Steellson
//

import UIKit


final class TDTextField: UITextField {
    
    init(_ placeholder: String) {
        super.init(frame: .zero)
        
        setupTextFieldAppereance()
        setupPlaceholderAppereance()
        addFieldSpacer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Methods
    
    private func setupTextFieldAppereance() {
        textColor = R.Colors.specialWhiteColor
        tintColor = R.Colors.specialWhiteColor
        backgroundColor = R.Colors.deepGrayBackgroundColor
        makeBorder(of: 2)
        layer.cornerRadius = 16
        font = .chalkboard18
        keyboardAppearance = .dark
        returnKeyType = .search
    }
    
    private func setupPlaceholderAppereance() {
        let attributedString = NSAttributedString(string: "", attributes: [
            .foregroundColor: R.Colors.shadowGrayColor,
            .font: UIFont.chalkboard16!
        ])
        self.attributedPlaceholder = attributedString
    }
    
    private func addFieldSpacer() {
        let imageView = UIImageView(image: R.Images.textFieldSpacer)
        imageView.tintColor = .clear
        leftView = imageView
        leftViewMode = .always
    }
}

