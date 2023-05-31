//
//  IsDoneView.swift
//
//  Created by Steellson
//

import UIKit
import SnapKit

final class IsDoneView: BaseView {
    
    private let isDoneMark: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.isDoneMarkImage
        view.tintColor = R.Colors.specialWhiteColor
        view.isHidden = true
        return view
    }()
    
    public enum State {
        case ready
        case isNotReady
    }
    
        
    func configure(with state: IsDoneView.State) {
        switch state {
        case .ready:
            backgroundColor = R.Colors.specialBlueColor
            isDoneMark.isHidden = false
        case .isNotReady:
            backgroundColor = R.Colors.deepGrayBackgroundColor
        }
    }
}

//MARK: - IsDoneView Extension

extension IsDoneView {
    
    override func setupView() {
        super.setupView()
        
        makeBorder(of: 1)
        layer.cornerRadius = 6
        
        addNewSubbview(isDoneMark)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        isDoneMark.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(30)
        }
    }
}
