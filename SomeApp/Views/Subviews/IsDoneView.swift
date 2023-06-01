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
    
    private var isDone: Bool {
        didSet {
            if self.isDone {
                backgroundColor = R.Colors.specialBlueColor
                isDoneMark.isHidden = false
            } else {
                backgroundColor = R.Colors.deepGrayBackgroundColor
                isDoneMark.isHidden = true
            }
        }
    }
    
    init(isDone: Bool) {
        self.isDone = isDone
        super.init(frame: .zero)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // External manage methods
    
    func makeState(_ isDone: Bool) {
        self.isDone = isDone
    }
    
    func stateToggle() {
        self.isDone.toggle()
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
            $0.edges.equalToSuperview().inset(5)
        }
    }
}
