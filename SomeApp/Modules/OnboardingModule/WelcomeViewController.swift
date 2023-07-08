//  WelcomeViewController.swift
//  SomeApp
//
//  Created by Steellson.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

final class WelcomeViewController: BaseController {
    
    var viewModel: TDViewModel!
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.greetingLabel.rawValue
        label.textColor = R.Colors.specialLimeColor
        label.font = .chalkboard28
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.nameLabelText.rawValue
        label.textAlignment = .left
        label.textColor = R.Colors.specialWhiteColor
        label.font = .chalkboard18
        label.textAlignment = .left
        return label
    }()
    
    private let nameField = TDTextField(R.Strings.nameFieldPlaceholder.rawValue)
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.Strings.startButtonTitle.rawValue, for: .normal)
        button.titleLabel?.font = .chalkboard16
        button.tintColor = R.Colors.deepGrayBackgroundColor
        button.backgroundColor = R.Colors.specialBlueColor
        button.layer.cornerRadius = 12
        button.makeBorder(of: 2)
        button.makeShadow()
        return button
    }()
    
    private let disposeBag = DisposeBag()
}

//MARK: - Base Methods Extension

extension WelcomeViewController {
    
    override func setupView() {
        super.setupView()
        setupBindings()
        
        [
            greetingLabel, nameLabel, nameField, startButton
        ]
            .forEach { view.addNewSubbview($0) }
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        greetingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-80)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(greetingLabel.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
        
        nameField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.width.equalTo(view.frame.width * 0.7)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(nameField.snp.bottom).offset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(45)
            $0.centerX.equalToSuperview()
        }
    }
}

//MARK: - Bindings Extension

private extension WelcomeViewController {
    
    func setupBindings() {
        bindNameField(text: nameField.rx.text.orEmpty.asDriver())
    }
    
    func bindNameField(text: Driver<String>) {
        let input = TDViewModel.Input(
            text: text
        )
        
        let output = viewModel?.transform(input: input)
        
        // Te
        output?.isEmpty
            .drive { [nameField] isValid in
                nameField.layer.borderColor = isValid
                ? R.Colors.specialLimeColor.cgColor
                : R.Colors.specialWhiteColor.cgColor
            }
            .disposed(by: disposeBag)
    }
}
