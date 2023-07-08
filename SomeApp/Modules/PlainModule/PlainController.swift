//
//  PlainController.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class PlainController: BaseController {
    
    private let cancelButton = TDButton(.cancelButton)
    
    private lazy var calendarCollectionView: UICollectionView = {
        let calLayout = UICollectionViewFlowLayout()
        calLayout.minimumLineSpacing = 10
        calLayout.scrollDirection = .horizontal
        calLayout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        calLayout.itemSize = .init(width: 60, height: 60)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: calLayout)
        cv.makeShadow()
        cv.layer.cornerRadius = 10
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = R.Colors.deepGrayBackgroundColor
        cv.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.cellId)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    private var plainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
}


//MARK: - BaseController Methods Extension

extension PlainController {
    
    override func setupView() {
        super.setupView()
        
        [
            cancelButton, calendarCollectionView, plainScrollView
        ]
            .forEach { view.addNewSubbview($0) }
    }

    override func setupLayout() {
        super.setupLayout()
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(45)
        }
        
        calendarCollectionView.snp.makeConstraints {
            $0.top.equalTo(cancelButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        plainScrollView.snp.makeConstraints {
            $0.top.equalTo(calendarCollectionView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: - DS / Delegates

extension PlainController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let calendarCell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.cellId,
                                                              for: indexPath) as? CalendarCell else { return UICollectionViewCell() }
        return calendarCell
    }
}

extension PlainController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        collectionView.reloadData()
    }
}
