//
//  ModeView.swift
//
//  Created by Steellson
//

import UIKit
import SnapKit

final class ModeView: BaseView {
    
    private var selectGestureRecognizer: UITapGestureRecognizer!
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = .chalkboard18
        title.textColor = R.Colors.specialWhiteColor
        return title
    }()

    var isPressed: Bool = false {
        didSet {
            if isPressed {
                backgroundColor = R.Colors.specialBlueColor
                makeBorder(of: 2.5)
            } else {
                backgroundColor = R.Colors.deepGrayBackgroundColor
                makeBorder(of: 2, color: R.Colors.shadowGrayColor)
            }
        }
    }

    // Setup
    
    func configureTitle(with text: String, _ state: Bool) {
        self.title.text = text
        self.isPressed = state
    }

    private func setupTapGestureRecognizer() {
        selectGestureRecognizer = UITapGestureRecognizer()
        selectGestureRecognizer.addTarget(self, action: #selector(tapGestureAction))
    }
    
    @objc private func tapGestureAction() {
        self.isPressed.toggle()
    }
}

//MARK: - ModeView Extension

extension ModeView {
    
    override func setupView() {
        super.setupView()
        layer.cornerRadius = 10
        
        setupTapGestureRecognizer()
        addNewSubbview(title)
        addGestureRecognizer(selectGestureRecognizer)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
