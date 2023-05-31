//
//  TDViewController.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDViewController: BaseController {
    
    private let greatingTitle: UILabel = {
        let label = UILabel()
        label.text = "Hey bro!"
        label.font = .chalkboard28
        label.textColor = R.Colors.specialLimeColor
        return label
    }()
    
    private let greatingSubtitle: UILabel = {
        let label = UILabel()
        label.text = "Are u ready for hardworking today? :)"
        label.font = .chalkboard16
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let searchView = SearchView()
    
    private let dateLable: UILabel = {
        let label = UILabel()
        label.text = "17th April"
        label.font = .chalkboard28
        label.textColor = R.Colors.specialLimeColor
        return label
    }()
    
    private let modeSelectionView = ModeSelectionView()
    
    private let todayTasksLable: UILabel = {
        let label = UILabel()
        label.text = "Today tasks"
        label.font = .chalkboard24
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.makeBorder(of: 2)
        button.backgroundColor = R.Colors.specialLimeColor
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .chalkboard28
        return button
    }()
    
    private let calendarButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = R.Colors.deepGrayBackgroundColor
        button.makeBorder(of: 2)
        button.setTitle("Cal", for: .normal)
        return button
    }()
    
    private var tdCollectionView: UICollectionView!
    
    private let tdTasksData = TDData().tasks
    
    private func setupTDCollectionView() {
        let tdLayout = UICollectionViewFlowLayout()
        tdLayout.scrollDirection = .vertical
        tdLayout.minimumLineSpacing = 30
        
        tdCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tdLayout)
        tdCollectionView.makeShadow()
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
        
        searchView.snp.makeConstraints {
            $0.top.equalTo(greatingSubtitle.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        dateLable.snp.makeConstraints {
            $0.top.equalTo(searchView.snp.bottom).offset(25)
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
        
        calendarButton.snp.makeConstraints {
            $0.top.equalTo(modeSelectionView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(45)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(modeSelectionView.snp.bottom).offset(20)
            $0.trailing.equalTo(calendarButton.snp.leading).offset(-20)
            $0.height.width.equalTo(45)
        }
                
        tdCollectionView.snp.makeConstraints {
            $0.top.equalTo(addButton.snp.bottom).offset(25)
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
        .init(width: view.bounds.width - 40, height: view.bounds.height / 8)
    }
}


/*
//MARK: - TDViewControllerViewProtocol Extension

extension TDViewController: TDViewControllerViewProtocol {
    
}
*/
