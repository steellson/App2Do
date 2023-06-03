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
    
    private let checkmarkView: UIView = {
        let view = UIView()
        view.makeBorder(of: 1)
        view.layer.cornerRadius = 6
        view.backgroundColor = R.Colors.deepGrayBackgroundColor
        return view
    }()
    
    private var checkmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.Images.isDoneMarkImage
        imageView.tintColor = R.Colors.specialWhiteColor
        return imageView
    }()
    
    private var isDone: Bool {
        didSet {
            if self.isDone {
                checkmarkView.backgroundColor = R.Colors.specialBlueColor
                checkmark.isHidden = false
            } else {
                checkmarkView.backgroundColor = R.Colors.deepGrayBackgroundColor
                checkmark.isHidden = true
            }
        }
    }

    override init(frame: CGRect) {
        self.isDone = false
        super.init(frame: frame)
        
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(with text: String, isDone: Bool) {
        self.textLabel.text = text
        self.isDone = isDone
    }
}


//MARK: - TDCell Extension

extension TDCell {
    
    private func setupCell() {
        backgroundColor = R.Colors.deepGrayBackgroundColor
        layer.cornerRadius = 18
        makeBorder(of: 2)
        
        [textLabel, checkmarkView].forEach { addNewSubbview($0) }
        checkmarkView.addNewSubbview(checkmark)
    }
    
    private func setupLayout() {
        
        let sideOffset = frame.width / 10
        
        checkmarkView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(sideOffset * 0.5)
            $0.width.height.equalTo(50)
        }
        
        checkmark.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }
        
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(sideOffset)
            $0.trailing.equalTo(checkmarkView.snp.leading).offset(sideOffset)
        }
    }
}
