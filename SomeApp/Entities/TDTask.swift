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
    var priority: Int?
    var isDone: Bool
    
}

//MARK: - Temporary date warehouse

public struct TDData {
    
    var tasks = [
        TDTask(text: "Drink water", time: nil, priority: nil, isDone: true),
        TDTask(text: "Meet", time: nil, priority: nil, isDone: true),
        TDTask(text: "Going to doctor", time: nil, priority: nil, isDone: false),
        TDTask(text: "Get high", time: nil, priority: nil, isDone: false),
    ]
}
