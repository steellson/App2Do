//
//  ModeView.swift
//
//  Created by Steellson
//

import UIKit
import SnapKit

final class ModeView: BaseView {
    
    private let title: UILabel = {
        let title = UILabel()
        return title
    }()
    
    func configureTitle(with text: String) {
        self.title.text = text
    }

}

//MARK: - ModeView Extension

extension ModeView {
    
    override func setupView() {
        super.setupView()
        
        addNewSubbview(title)

        layer.cornerRadius = 14
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        
        makeShadow(opacity: 1)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
