//
//  AddTaskController.swift
//
//  Created by Steellson


import UIKit
import SnapKit


final class AddTaskController: BaseController {
    
    private var calncelButton = UIButton()
    private let addNewTaskLabel = UILabel()
    private let taskTextView = UITextView()
    private let addTaskButton = UIButton()

    private let dateService = DateService()
    private let realmManager = RealmManager()
    
    // Setup methods
    
    private func setupCancelButton() {
        calncelButton.layer.cornerRadius = 10
        calncelButton.backgroundColor = R.Colors.specialPinkColor
        calncelButton.makeBorder(of: 2, color: R.Colors.shadowGrayColor)
        calncelButton.setImage(R.Images.cancelButtonImage, for: .normal)
        calncelButton.tintColor = .black
        calncelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    
    private func setupAddNewTaskLabel() {
        addNewTaskLabel.text = R.Strings.addTaskTextLabel.rawValue
        addNewTaskLabel.font = .chalkboard28
        addNewTaskLabel.textColor = R.Colors.specialWhiteColor
    }
    
    private func setupTaskTextView() {
        taskTextView.layer.cornerRadius = 10
        taskTextView.font = .chalkboard18
        taskTextView.textColor = R.Colors.specialWhiteColor
        taskTextView.backgroundColor = R.Colors.shadowGrayColor
        taskTextView.makeBorder(of: 2)
        taskTextView.delegate = self
    }
    
    private func setupAddTaskButton() {
        addTaskButton.layer.cornerRadius = 10
        addTaskButton.makeBorder(of: 2, color: R.Colors.shadowGrayColor)
        addTaskButton.backgroundColor = R.Colors.specialLimeColor
        addTaskButton.setImage(R.Images.addTaskButtonImage, for: .normal)
        addTaskButton.tintColor = .black
        addTaskButton.titleLabel?.font = .chalkboard28
        addTaskButton.addTarget(self, action: #selector(addTaskButtonAction), for: .touchUpInside)
    }
}


//MARK: - BaseController Methods Extension

extension AddTaskController {
    
    override func setupView() {
        super.setupView()
        
        setupCancelButton()
        setupAddNewTaskLabel()
        setupTaskTextView()
        setupAddTaskButton()
        
        [
         calncelButton, addNewTaskLabel,
         taskTextView,addTaskButton
        ].forEach { view.addNewSubbview($0) }
        
    }

    override func setupLayout() {
        super.setupLayout()
        
        calncelButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(45)
        }
        
        addNewTaskLabel.snp.makeConstraints {
            $0.top.equalTo(calncelButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        taskTextView.snp.makeConstraints {
            $0.top.equalTo(addNewTaskLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(view.frame.height * 0.5)
        }
        
        addTaskButton.snp.makeConstraints {
            $0.top.equalTo(taskTextView.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(60)
        }
    }
}

//MARK: - TasTextViewDelegate Extension

extension AddTaskController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder() //
        textView.enablesReturnKeyAutomatically = true
    }
    
    
}

//MARK: - Button Actions

@objc private extension AddTaskController {
    
     func cancelButtonAction() {
         self.dismiss(animated: true)
    }
    
    func addTaskButtonAction() {
        if self.taskTextView.text != "" {
            let task = TaskRealmModel()
            task.text = taskTextView.text ?? "Empty task :j"
            task.time = dateService.getCurrentTime()
            
            do {
                try realmManager.save(object: task)
            } catch (let error) {
                print("Creating task error: \(error.localizedDescription)")
            }
        }
    }
}

/*
//MARK: - AddTaskControllerViewProtocol Extension

extension AddTaskController: AddTaskControllerViewProtocol {
    
}
*/
