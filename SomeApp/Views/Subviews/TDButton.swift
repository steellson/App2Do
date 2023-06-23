//
//  TDButton.swift
//
//  Created by Steellson
//

import UIKit

final class TDButton: UIButton {
    
    enum TDButtonType {
        case addButton
        case cancelButton
        case plainButton
    }
    
    private let tdButtonType: TDButtonType
    
    init(_ buttonType: TDButtonType) {
        self.tdButtonType = buttonType
        super.init(type: .system)

        setupMainAppereance()
        setupButton(with: buttonType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Setup methods
    
    private func setupButton(with buttonType: TDButtonType) {
        switch buttonType {
        case .addButton:
            setupAddButton()
        case .cancelButton:
            setupCancelButton()
        case .plainButton:
            setupPlainButton()
        }
    }
    
    private func setupMainAppereance() {
        layer.cornerRadius = 10
        makeBorder(of: 2, color: R.Colors.shadowGrayColor)
        titleLabel?.font = .chalkboard16
        tintColor = .black

    }
    
    private func setupAddButton() {
        backgroundColor = R.Colors.specialLimeColor
        setImage(R.Images.addTaskButtonImage, for: .normal)
    }
    
    private func setupCancelButton() {
        backgroundColor = R.Colors.specialPinkColor
        setImage(R.Images.cancelButtonImage, for: .normal)
    }
    
    private func setupPlainButton() {
        backgroundColor = R.Colors.specialPinkColor
        setImage(R.Images.calendarButtonImage, for: .normal)
    }
}
