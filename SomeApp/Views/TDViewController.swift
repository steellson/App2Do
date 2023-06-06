//
//  TDViewController.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDViewController: BaseController {
    
    private let greatingTitle: UILabel = {
        let label = UILabel()
        label.text = R.Strings.greatingLabelTD.rawValue
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
        label.text = R.Strings.todayTasksLabel.rawValue
        label.font = .chalkboard24
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.makeBorder(of: 2, color: R.Colors.shadowGrayColor)
        button.backgroundColor = R.Colors.specialLimeColor
        button.setImage(R.Images.addTaskButtonImage, for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .chalkboard28
        return button
    }()
    
    private let calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.backgroundColor = R.Colors.specialPinkColor
        button.makeBorder(of: 2, color: R.Colors.shadowGrayColor)
        button.setImage(R.Images.calendarButtonImage, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private var tdCollectionView: UICollectionView!
    
    private let taskManager: TaskManager = TaskManager()
    
    
    // Setup Controller
    
    init(userName: String) {
        super.init(nibName: nil, bundle: nil)
        
        taskManager.createTask(with: "Waking up", time: nil, priority: nil, isDone: true)
        taskManager.createTask(with: "Going eat", time: nil, priority: nil, isDone: true)
        taskManager.createTask(with: "Meet up", time: nil, priority: nil, isDone: false)
        taskManager.createTask(with: "Working", time: nil, priority: nil, isDone: false)
        
        let currentName = userName == "" ? "bro" : userName
        self.greatingTitle.text = R.Strings.greatingLabelTD.rawValue + currentName.capitalized + "!"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        setupTDCollectionView()
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
        return taskManager.tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tdCell = collectionView.dequeueReusableCell(withReuseIdentifier: TDCell.cellId,
                                                              for: indexPath) as? TDCell else { return UICollectionViewCell() }
        let task = taskManager.tasks[indexPath.item]
        tdCell.configureCell(with: task.text, isDone: task.isDone)
        return tdCell
    }
}

extension TDViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let task = taskManager.tasks[indexPath.item]
        task.switchState()
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let task = taskManager.tasks[indexPath.item]
        taskManager.getTaskInfo(by: task.id)
        collectionView.reloadData()
        return true
    }
}

/*
//MARK: - TDViewControllerViewProtocol Extension

extension TDViewController: TDViewControllerViewProtocol {
    
}
*/
