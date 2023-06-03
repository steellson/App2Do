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

    var isPressed: Bool {
        didSet {
            if self.isPressed {
                backgroundColor = R.Colors.specialBlueColor
            } else {
                backgroundColor = R.Colors.deepGrayBackgroundColor
            }
        }
    }
    
    init() {
        self.isPressed = false
        super.init(frame: .zero)
        
        layer.cornerRadius = 10
        makeBorder(of: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
