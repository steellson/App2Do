//
//  TDDateLabel.swift
//
//  Created by Steellson
//

import UIKit

final class TDDateLabel: UILabel {

    private let dateService: DateServiceProtocol = DateService()


    override init(frame: CGRect) {
        super.init(frame: frame)

        setupDateLabel()
        setupLabelText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Setup methods
    
    private func setupDateLabel() {
        font = .chalkboard28
        textColor = R.Colors.specialLimeColor
    }
    
    private func setupLabelText() {
        let day = String(dateService.getCurrentDayNumber())
        let month = dateService.getCurrentMonth()
        
        text = day + " " + month
    }
}
