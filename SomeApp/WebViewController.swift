//
//  WebViewController.swift
//
//  Created by Steellson


import UIKit
import SnapKit
import WebKit


final class WebViewController: BaseController {
    
    private var webView: WKWebView!
    
    private func setupWebView() {
        let webViewConfguration = WKWebViewConfiguration()
        
        webView = WKWebView(frame: .zero, configuration: webViewConfguration)
    }
}


//MARK: - BaseController Methods Extension

extension WebViewController {
    
    override func setupView() {
        super.setupView()
        
        setupWebView()
        view.addNewSubbview(webView)
    }

    override func setupLayout() {
        super.setupLayout()
        
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

/*
//MARK: - WebViewControllerViewProtocol Extension

extension WebViewController: WebViewControllerViewProtocol {
    
}
*/
