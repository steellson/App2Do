//
//  ModeSelectionView.swift
//
//  Created by Steellson
//

import UIKit
import SnapKit

final class ModeSelectionView: BaseView {
    
    private let modes = ["today", "pending", "done"]
    private var hStack = UIStackView()
    
    private func setupHStack() {
        modes.forEach {
            let modeView = ModeView()
            modeView.configureTitle(with: $0)
            hStack.addArrangedSubview(modeView)
        }
        hStack.arrangedSubviews.first?.backgroundColor = R.Colors.specialBlueColor
        hStack.distribution = .fillEqually
        hStack.spacing = 10
    }
}

//MARK: - ModeSelectionView Extension

extension ModeSelectionView {
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = .clear
        
        addNewSubbview(hStack)
        setupHStack()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        hStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
