//
//  TDTask.swift
//  SomeApp
//
//  Created by Steellson.
//

import Foundation

struct TDTask: Identifiable {
    
    let id: String = UUID().uuidString
    let text: String
    let time: Date?
    var priority: Int?
    var isDone: Bool
    
}
