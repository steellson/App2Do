//
//  AddTaskController.swift
//
//  Created by Steellson


import UIKit
import SnapKit


final class AddTaskController: BaseController {
    
    private var cancelButton = TDButton(.cancelButton)
    
    private let addNewTaskLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.addTaskTextLabel.rawValue
        label.font = .chalkboard28
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private lazy var taskTextView: UITextView = {
        let tv = UITextView()
        tv.layer.cornerRadius = 10
        tv.font = .chalkboard24
        tv.keyboardAppearance = .dark
        tv.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        tv.textColor = .black
        tv.backgroundColor = R.Colors.shadowGrayColor
        tv.makeBorder(of: 2)
        tv.delegate = self
        return tv
    }()
    
    private lazy var addTaskButton = TDButton(.addButton)
}


//MARK: - BaseController Methods Extension

extension AddTaskController {
    
    override func setupView() {
        super.setupView()

        [
         cancelButton, addNewTaskLabel, taskTextView,addTaskButton
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
        
        addNewTaskLabel.snp.makeConstraints {
            $0.top.equalTo(cancelButton.snp.bottom).offset(30)
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
