//
//  TaskManager.swift
//
//  Created by Steellson
//

import Foundation

protocol TaskManagerProtocol: AnyObject {
    func createTask(with text: String, time: String?, priority: Int?, isDone: Bool)
    func removeTask(by id: String)
    func updateTask(by id: String, text: String, time: String?, priority: Int?, isDone: Bool)
    func getTaskInfo(by id: String)
}

final class TaskManager {

    var tasks: [Task] = []
    
}

//MARK: - Task Manager Protocol Extension

extension TaskManager: TaskManagerProtocol {
    
    func createTask(with text: String,
                    time: String?,
                    priority: Int?,
                    isDone: Bool) {
        self.tasks.append(Task(text: text,
                               time: time,
                               priority: priority,
                               isDone: isDone))
    }
    
    func removeTask(by id: String) {
        tasks.enumerated().forEach {
            if $1.id == id {
                tasks.remove(at: $0)
            }
        }
    }
    
    func updateTask(by id: String,
                    text: String,
                    time: String?,
                    priority: Int?,
                    isDone: Bool) {
        
        tasks.forEach {
            if $0.id == id {
                $0.text = text
                $0.time = time
                $0.priority = priority
                $0.isDone = isDone
            }
        }
    }
    
    func getTaskInfo(by id: String) {
        tasks.forEach {
            if $0.id == id {
                print("TD: \($0.text)\nTime: \($0.time ?? "-")")
                print("Priority: \($0.priority ?? 0)\nIsDone: \($0.isDone)")
            }
        }
    }
}
