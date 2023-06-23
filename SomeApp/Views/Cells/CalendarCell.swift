//
//  CalendarCell.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class CalendarCell: UICollectionViewCell {
    
    static let cellId = R.Strings.calendarCellReuseIndentifier.rawValue

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell() {
        
    }
}


//MARK: - TDCell Extension

private extension CalendarCell {
    
    func setupCell() {
        backgroundColor = R.Colors.shadowGrayColor
        layer.cornerRadius = 10
        makeBorder(of: 2)
        
        [].forEach { addNewSubbview($0) }
    }
    
    func setupLayout() {

    }
}

//MARK: - Gestures Extension

private extension CalendarCell {

}
