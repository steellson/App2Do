//  WelcomeViewController.swift
//  SomeApp
//
//  Created by Steellson.
//

import UIKit
import SnapKit

final class WelcomeViewController: BaseController {
    
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
    private let startButton = UIButton(type: .system)
    
    private let realmManager = RealmManager()
    
    
    private func setupStartButton() {
        startButton.setTitle(R.Strings.startButtonTitle.rawValue, for: .normal)
        startButton.titleLabel?.font = .chalkboard16
        startButton.tintColor = R.Colors.deepGrayBackgroundColor
        startButton.backgroundColor = R.Colors.specialBlueColor
        startButton.layer.cornerRadius = 12
        startButton.makeBorder(of: 2)
        startButton.makeShadow()
        
        startButton.addTarget(self, action: #selector(startButtonTarget), for: .touchUpInside)
    }
}

//MARK: - Base Methods Extension

extension WelcomeViewController {
    
    override func setupView() {
        super.setupView()
        
        [greetingLabel, nameLabel, nameField, startButton].forEach { view.addNewSubbview($0) }
        
        setupStartButton()
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

//MARK: - Button Target

private extension WelcomeViewController {
    
    @objc func startButtonTarget() {
        if nameField.text != "" {
            realmManager.setupClient(with: nameField.text!)
            
            let mainViewController = TDViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true)
        } else {
            self.nameField.placeholder = "oups :j"
            return
        }
    }
}
