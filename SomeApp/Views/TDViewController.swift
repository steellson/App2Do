//
//  TDViewController.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDViewController: BaseController {
    
    private let greatingTitle: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private let greatingSubtitle: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private let searchView: UIView = {
        let search = UIView()
        return search
    }()
    
    private let dateLable: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private let modeSelectionView = ModeSelectionView()
    
    private let addButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let calendarButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let todayTasksLable: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private var tdCollectionView: UICollectionView!
    
    private let tdTasksData = TDData().tasks
    
    private func setupTDCollectionView() {
        let tdLayout = UICollectionViewFlowLayout()
        tdLayout.scrollDirection = .vertical
        
        tdCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tdLayout)
        tdCollectionView.makeShadow(opacity: 0.8)
        tdCollectionView.layer.cornerRadius = 10
        tdCollectionView.backgroundColor = .clear
        tdCollectionView.register(TDCell.self, forCellWithReuseIdentifier: "TDCell")
        tdCollectionView.dataSource = self
        tdCollectionView.delegate = self
    }
}


//MARK: - BaseController Methods Extension

extension TDViewController {
    
    override func setupView() {
        super.setupView()
        
        setupTDCollectionView()
        
        // Add subbviews
        [
            greatingTitle, greatingSubtitle, searchView, dateLable,
            modeSelectionView, addButton, calendarButton, todayTasksLable, tdCollectionView
        ].forEach { view.addNewSubbview($0) }
    }

    override func setupLayout() {
        super.setupLayout()
        
        modeSelectionView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(80)
            $0.width.equalTo(400)
            $0.height.equalTo(100)
        }
                
        tdCollectionView.snp.makeConstraints {
            $0.top.equalTo(modeSelectionView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


//MARK: - DS / Delegates

extension TDViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tdTasksData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tdCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TDCell", for: indexPath) as? TDCell else { return UICollectionViewCell() }
        
        let tasksText = tdTasksData[indexPath.item].text
        tdCell.configureCell(with: tasksText)
        
        return tdCell
    }
}

extension TDViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.bounds.width - 12, height: view.bounds.height / 8)
    }
}


/*
//MARK: - TDViewControllerViewProtocol Extension

extension TDViewController: TDViewControllerViewProtocol {
    
}
*/
