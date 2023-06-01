//
//  TaskManager.swift
//
//  Created by Steellson
//

import Foundation

protocol TaskManagerProtocol: AnyObject {
    func createTask(with text: String, time: Date?, priority: Int?, isDone: Bool)
    func removeTask(by id: String)
    func updateTask()
    func getTaskInfo(by id: String)
}

final class TaskManager {
    
    private var tasks: [TDTask]?

}


extension TaskManager: TaskManagerProtocol {
    
    func createTask(with text: String,
                    time: Date?,
                    priority: Int?,
                    isDone: Bool) {
        self.tasks?.append(TDTask(text: text,
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
