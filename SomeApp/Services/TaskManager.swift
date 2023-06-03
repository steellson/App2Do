//
//  TaskManager.swift
//
//  Created by Steellson
//

import Foundation

protocol TaskManagerProtocol: AnyObject {
    func createTask(with text: String, time: String?, priority: Int?, isDone: Bool)
    func removeTask(by id: String)
    func updateTask()
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
        //
    }
    
    func updateTask() {
        //
    }
    
    func getTaskInfo(by id: String) {
        //
    }
    

}
