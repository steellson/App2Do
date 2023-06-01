//
//  SearchView.swift
//
//  Created by Steellson
//

import UIKit
import SnapKit

final class SearchView: BaseView {
    
    private let buttonSublayer: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.deepGrayBackgroundColor
        view.makeBorder(of: 1.5)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.Colors.specialPinkColor
        button.makeBorder(of: 1.5)
        button.layer.cornerRadius = 5
        button.setImage(R.Images.searchViewImage, for: .normal)
        button.tintColor = R.Colors.specialWhiteColor
        return button
    }()
    
    private let searchTextField = TextField()
}

//MARK: - SearchView Extension

extension SearchView {
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = R.Colors.deepGrayBackgroundColor
        layer.cornerRadius = 12
        makeBorder(of: 2)
        makeShadow()
        
        addNewSubbview(buttonSublayer)
        addNewSubbview(searchButton)
        addNewSubbview(searchTextField)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        buttonSublayer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(13)
            $0.centerY.equalToSuperview().offset(3)
            $0.width.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(searchButton.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
