//
//  TDTask.swift
//  SomeApp
//
//  Created by Steellson.
//

import Foundation

struct TDTask {
    
    let text: String
    let time: Date?
    let priority: Int?
    let inCompleted: Bool
    
}

//MARK: - Temporary date warehouse

public struct TDData {
    
    var tasks = [
        TDTask(text: "Drink water", time: nil, priority: nil, inCompleted: true),
        TDTask(text: "Meet", time: nil, priority: nil, inCompleted: true),
        TDTask(text: "Going to doctor", time: nil, priority: nil, inCompleted: false),
        TDTask(text: "Get high", time: nil, priority: nil, inCompleted: false),
    ]
}
