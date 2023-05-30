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
        title.font = .chalkboard18
        title.textColor = R.Colors.specialWhiteColor
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

        backgroundColor = R.Colors.deepGrayBackgroundColor
        layer.cornerRadius = 10
        
        makeBorder(of: 2)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
