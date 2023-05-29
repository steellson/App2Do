//
//  TDCell.swift
//
//  Created by Steellson


import UIKit


final class TDCell: UICollectionViewCell {
    
    private var textLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private var priorityView: UIView = {
       let view = UIView()
        return view
    }()
    
    private var isDoneView: UIView = {
       let view = UIView()
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureCell(with text: String) {
        self.textLabel.text = text
    }
}

//MARK: - TDCell Extension

extension TDCell {
    
    private func setupCell() {
        backgroundColor = .white.withAlphaComponent(0.15)
        layer.cornerRadius = 16
        makeShadow(opacity: 0.3)
        
        [textLabel, priorityView, isDoneView].forEach { addNewSubbview($0) }
    }
    
    private func setupLayout() {
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(frame.width / 10)
        }
    }
}
