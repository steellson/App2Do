//
//  TDCell.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDCell: UICollectionViewCell {
    
    static let cellId = R.Strings.tdCellReuseIdentifier.rawValue
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.font = .chalkboard18
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private var isDoneView = IsDoneView(isDone: false)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(with text: String, isDone: Bool) {
        self.textLabel.text = text
        self.isDoneView.makeState(isDone)
    }
}


//MARK: - TDCell Extension

extension TDCell {
    
    private func setupCell() {
        backgroundColor = R.Colors.deepGrayBackgroundColor
        layer.cornerRadius = 18
        makeBorder(of: 2)

        [textLabel, isDoneView].forEach { addNewSubbview($0) }
    }
    
    private func setupLayout() {
        
        let sideOffset = frame.width / 10
        
        isDoneView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(sideOffset * 0.5)
            $0.width.height.equalTo(50)
        }
        
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(sideOffset)
            $0.trailing.equalTo(isDoneView.snp.leading).offset(sideOffset)
        }
    }
}
