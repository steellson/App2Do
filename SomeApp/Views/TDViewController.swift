//
//  TDViewController.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDViewController: BaseController {
        
    private var greatingTitle: UILabel = {
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
        label.text = R.Strings.todayTasksLabel.rawValue
        label.font = .chalkboard24
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let addButton = TDButton(.addButton)
    
    private let plainButton = TDButton(.plainButton)
    
    private var tdCollectionView: UICollectionView!
    
    private let realmManager = RealmManager()
    
    private var tasks: [TaskRealmModel] {
        realmManager.getAllObjects()
    }
    
    private func setupGreetingTitleText() {
        let clientName = realmManager.getClientName()
        self.greatingTitle.text = R.Strings.greatingLabelTD.rawValue  + clientName + "!"

    }
    
    private func setupAddButton() {
        addButton.addTarget(self, action: #selector(addNewTaskButtonAction), for: .touchUpInside)
    }
    
    private func setupTDCollectionView() {
        let tdLayout = UICollectionViewFlowLayout()
        tdLayout.scrollDirection = .vertical
        tdLayout.minimumLineSpacing = 30
        tdLayout.itemSize = .init(width: view.bounds.width - 40,
                                  height: view.bounds.height / 8)

        tdCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tdLayout)
        tdCollectionView.makeShadow()
        tdCollectionView.layer.cornerRadius = 10
        tdCollectionView.showsVerticalScrollIndicator = false
        tdCollectionView.backgroundColor = R.Colors.deepGrayBackgroundColor
        tdCollectionView.register(TDCell.self, forCellWithReuseIdentifier: TDCell.cellId)
        tdCollectionView.dataSource = self
        tdCollectionView.delegate = self
    }
}


//MARK: - BaseController Methods Extension

extension TDViewController {
    
    override func setupView() {
        super.setupView()
        setupGreetingTitleText()
        setupAddButton()
        setupTDCollectionView()
        
        [
            greatingTitle, greatingSubtitle, categoriesView, dateLable,
            modeSelectionView, addButton, plainButton, todayTasksLable, tdCollectionView
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


//MARK: - DS / Delegates

extension TDViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tdCell = collectionView.dequeueReusableCell(withReuseIdentifier: TDCell.cellId,
                                                              for: indexPath) as? TDCell else { return UICollectionViewCell() }
        let task = tasks[indexPath.item]
        tdCell.configureCell(with: task.text, isDone: task.isDone)
        return tdCell
    }
}

extension TDViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let task = tasks[indexPath.item]
        realmManager.switchObjectState(forKey: task._id)
        collectionView.reloadData()
    }
}


//MARK: - Button Actions

@objc private extension TDViewController {
    
     func addNewTaskButtonAction() {
        let addTaskController = AddTaskController()
        addTaskController.modalPresentationStyle = .fullScreen
        self.present(addTaskController, animated: true)
    }
    
    func plainButtonAction() {
       let plainController = PlainController()
        plainController.modalPresentationStyle = .fullScreen
       self.present(plainController, animated: true)
   }
}

/*
//MARK: - TDViewControllerViewProtocol Extension

extension TDViewController: TDViewControllerViewProtocol {
    
}
*/
