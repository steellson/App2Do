//
//  Task.swift
//
//  Created by Steellson
//

import Foundation

protocol TaskProtocol: AnyObject {
    var id: String { get }
    var text: String { get set }
    var time: String? { get set }
    var priority: Int? { get set }
    var isDone: Bool { get set }
    
    func switchState()
}

final class Task: TaskProtocol {
    
    var id: String = UUID().uuidString
    var text: String
    var time: String?
    var priority: Int?
    var isDone: Bool
    
    init(text: String,
         time: String? = nil,
         priority: Int? = nil,
         isDone: Bool) {
        
        self.text = text
        self.time = time
        self.priority = priority
        self.isDone = isDone
    }
        
    func switchState() {
        self.isDone.toggle()
    }
}
