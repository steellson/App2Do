//  WelcomeViewController.swift
//  SomeApp
//
//  Created by Steellson.
//

import UIKit
import SnapKit

final class WelcomeViewController: BaseController {
    
    private let startButton = UIButton(type: .system)
    
    private func setupStartButton() {
        startButton.setTitle("Let's Start!", for: .normal)
        startButton.backgroundColor = .white.withAlphaComponent(0.8)
        startButton.layer.cornerRadius = 12
        startButton.makeBorder(of: 0.3)
        startButton.makeShadow(opacity: 1)
        
        startButton.addTarget(self, action: #selector(startButtonTarget), for: .touchUpInside)
    }
}

//MARK: - Base Methods Extension

extension WelcomeViewController {
    
    override func setupView() {
        super.setupView()
        
        view.addNewSubbview(startButton)
        setupStartButton()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        startButton.snp.makeConstraints {
            $0.width.equalTo(240)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(80)
        }
    }
}

//MARK: - Button Target

private extension WelcomeViewController {
    
    @objc func startButtonTarget() {
        let tdController = TDViewController()
        tdController.modalPresentationStyle = .fullScreen
        
        self.present(tdController, animated: true)
    }
}
