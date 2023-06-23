//
//  AddTaskController.swift
//
//  Created by Steellson


import UIKit
import SnapKit


final class AddTaskController: BaseController {
    
    private var calncelButton = TDButton(.cancelButton)
    private let addNewTaskLabel = UILabel()
    private let taskTextView = UITextView()
    private let addTaskButton = TDButton(.addButton)

    private let dateService = DateService()
    private let realmManager = RealmManager()
    
    
    // Setup methods
    
    private func setupCancelButton() {
        calncelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    
    private func setupAddNewTaskLabel() {
        addNewTaskLabel.text = R.Strings.addTaskTextLabel.rawValue
        addNewTaskLabel.font = .chalkboard28
        addNewTaskLabel.textColor = R.Colors.specialWhiteColor
    }
    
    private func setupTaskTextView() {
        taskTextView.layer.cornerRadius = 10
        taskTextView.font = .chalkboard24
        taskTextView.keyboardAppearance = .dark
        taskTextView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        taskTextView.textColor = .black
        taskTextView.backgroundColor = R.Colors.shadowGrayColor
        taskTextView.makeBorder(of: 2)
        taskTextView.delegate = self
    }
    
    private func setupAddTaskButton() {
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
            $0.height.equalTo(view.frame.height * 0.4)
        }
        
        addTaskButton.snp.makeConstraints {
            $0.top.equalTo(taskTextView.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(45)
        }
    }
}

//MARK: - TaskTextViewDelegate Extension

extension AddTaskController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.enablesReturnKeyAutomatically = true
        textView.returnKeyType = .done
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
                print("Task \(task) saved!")
                
                self.dismiss(animated: true)
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
