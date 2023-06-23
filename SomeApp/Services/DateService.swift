//
//  DateService.swift
//
//  Created by Steellson.
//

import Foundation

protocol DateServiceProtocol: AnyObject {
    func getCurrentDate() -> String
    func getCurrentDayNumber() -> Int
    func getCurrentMonth() -> String
    func getCurrentTime() -> String
    func getDifference(from destinationTime: Date?)
}

final class DateService {
    
    private let date = Date()
    private let dateFormatter = DateFormatter()
    
    private var currentDate: String {
        let day = Calendar.current.component(.day, from: self.date)
        let month = Calendar.current.component(.month, from: self.date)
        let year = Calendar.current.component(.year, from: self.date)
        let current = "\(day).\(month).\(year)"
        return current
    }
    
    private var currentDayNumber: Int {
        Calendar.current.component(.day, from: self.date)
    }
    
    private var currentMonth: String {
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self.date)
    }
    
    private var currentTime: String {
        let hours = Calendar.current.component(.hour, from: self.date)
        let minutes = Calendar.current.component(.minute, from: self.date)
        let current = "\(hours):\(minutes)"
        return current
    }
    
    var destinationTime: Date?
}


//MARK: - DateServiceProtocol Extension

extension DateService: DateServiceProtocol {
    
    func getCurrentDate() -> String {
        self.currentDate
    }
    
    func getCurrentDayNumber() -> Int {
        self.currentDayNumber
    }
    
    func getCurrentMonth() -> String {
        self.currentMonth
    }
    
    func getCurrentTime() -> String {
        self.currentTime
    }
    
    func getDifference(from destinationTime: Date?) {
        //
    }
}
