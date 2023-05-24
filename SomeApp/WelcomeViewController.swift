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
        startButton.layer.cornerRadius = 14
        startButton.layer.borderColor = .init(gray: 1, alpha: 1)
        startButton.layer.borderWidth = 0.5
        
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
        
        let webViewController = WebViewController()
        present(webViewController, animated: true)
    }
}
