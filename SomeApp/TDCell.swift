//
//  TDCell.swift
//
//  Created by Steellson


import UIKit


final class TDCell: UICollectionViewCell {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureCell() {
        
    }
}

//MARK: - TDCell Extension

extension TDCell {
    
    private func setupCell() {
        
        backgroundColor = .white.withAlphaComponent(0.15)
        makeShadow(opacity: 0.3)
    }
    
    private func setupLayout() {

    }
}
