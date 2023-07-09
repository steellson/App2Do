//
//  TDViewController.swift
//
//  Created by Steellson


import UIKit
import RxCocoa
import RxSwift
import SnapKit

final class TDViewController: BaseController {
    
    private var viewModel: TDViewModelProtocol!
    
    private lazy var greatingTitle: UILabel = {
        let label = UILabel()
        label.font = .chalkboard28
        label.textColor = R.Colors.specialLimeColor
        return label
    }()
    
    private let greatingSubtitle: UILabel = {
        let label = UILabel()
        label.text = R.Strings.greatingSubtitleText.rawValue
        label.font = .chalkboard16
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let categoriesView = UIView()
    
    private let dateLable = TDDateLabel()
    
    private let modeSelectionView = ModeSelectionView()
    
    private let todayTasksLable: UILabel = {
        let label = UILabel()
        label.text = R.Strings.todayTasksLabel.rawValue
        label.font = .chalkboard24
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let addButton = TDButton(.addButton)
    
    private let plainButton = TDButton(.plainButton)
    
    private lazy var tdCollectionView: UICollectionView = {
        let tdLayout = UICollectionViewFlowLayout()
        tdLayout.scrollDirection = .vertical
        tdLayout.minimumLineSpacing = 30
        tdLayout.itemSize = .init(width: view.bounds.width - 40,
                                  height: view.bounds.height / 8)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: tdLayout)
        cv.makeShadow()
        cv.layer.cornerRadius = 10
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = R.Colors.deepGrayBackgroundColor
        cv.register(TDCell.self, forCellWithReuseIdentifier: TDCell.cellId)
//        cv.dataSource = self
//        cv.delegate = self
        return cv
    }()
}


//MARK: - BaseController Methods Extension

extension TDViewController {
    
    override func setupView() {
        super.setupView()
        
        [
            greatingTitle, greatingSubtitle, categoriesView, dateLable,
            modeSelectionView, addButton, plainButton, todayTasksLable, tdCollectionView
        ]
            .forEach { view.addNewSubbview($0) }
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        greatingTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        greatingSubtitle.snp.makeConstraints {
            $0.top.equalTo(greatingTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        categoriesView.snp.makeConstraints {
            $0.top.equalTo(greatingSubtitle.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        dateLable.snp.makeConstraints {
            $0.top.equalTo(categoriesView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        modeSelectionView.snp.makeConstraints {
            $0.top.equalTo(dateLable.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(view.frame.width * 0.75)
            $0.height.equalTo(40)
        }
        
        todayTasksLable.snp.makeConstraints {
            $0.top.equalTo(modeSelectionView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
        }
        
        plainButton.snp.makeConstraints {
            $0.top.equalTo(modeSelectionView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(45)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(modeSelectionView.snp.bottom).offset(20)
            $0.trailing.equalTo(plainButton.snp.leading).offset(-20)
            $0.height.width.equalTo(45)
        }
        
        tdCollectionView.snp.makeConstraints {
            $0.top.equalTo(addButton.snp.bottom).offset(25)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

