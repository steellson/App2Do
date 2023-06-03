//
//  ModeSelectionView.swift
//
//  Created by Steellson
//

import UIKit
import SnapKit

final class ModeSelectionView: BaseView {
    
    private let modes = [
        Mode(name: "today", isOn: true),
        Mode(name: "pending", isOn: false),
        Mode(name: "done", isOn: false)
    ]
    
    private var hStack = UIStackView()
    
    private func setupHStack() {
        hStack.distribution = .fillEqually
        hStack.spacing = 10

        modes.forEach {
            let modeView = ModeView()
            modeView.configureTitle(with: $0.name, $0.isOn)
            hStack.addArrangedSubview(modeView)
        }
    }
}

//MARK: - ModeSelectionView Extension

extension ModeSelectionView {
    
    override func setupView() {
        super.setupView()
        backgroundColor = .clear
        
        setupHStack()
        addNewSubbview(hStack)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        hStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
