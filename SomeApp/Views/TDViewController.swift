//
//  TDViewController.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDViewController: BaseController {
    
    private let navigationView = NavigationView()
    private var tdCollectionView: UICollectionView!
    
    private func setupTDCollectionView() {
        let tdLayout = UICollectionViewFlowLayout()
        tdLayout.scrollDirection = .vertical
        
        tdCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tdLayout)
        tdCollectionView.makeShadow(opacity: 0.8)
        tdCollectionView.layer.cornerRadius = 10
        tdCollectionView.backgroundColor = .clear
        tdCollectionView.register(TDCell.self, forCellWithReuseIdentifier: "TDCell")
        tdCollectionView.dataSource = self
        tdCollectionView.delegate = self
    }
    
}


//MARK: - BaseController Methods Extension

extension TDViewController {
    
    override func setupView() {
        super.setupView()
        
        setupTDCollectionView()
        view.addNewSubbview(tdCollectionView)
        
        navigationView.makeShadow(opacity: 1)
        view.addNewSubbview(navigationView)
    }

    override func setupLayout() {
        super.setupLayout()
        
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        tdCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


//MARK: - DS / Delegates

extension TDViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tdCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TDCell", for: indexPath)
        return tdCell
    }
}

extension TDViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.bounds.width - 12, height: view.bounds.height / 8)
    }
}


/*
//MARK: - TDViewControllerViewProtocol Extension

extension TDViewController: TDViewControllerViewProtocol {
    
}
*/
