//
//  Extensions+Date.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import Foundation

/// Date Format type
enum DateFormatType: String {
    /// Time
    case time = "HH:mm:ss"
    
    case timeAM = "h:mm a"
    
    /// Date with hours
    case dateWithTime = "dd-MMM-yyyy  h:mm a"
    
    /// Date
    case date = "dd-MMM-yyyy"
    
    // reverseDate
    case reverseDate = "yyyy-MM-dd"
    
    case shortDate = "MMM dd"
}

extension Date {
    func convertToString(dateformat formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = formatType.rawValue
        
        return dateFormatter.string(from: self)
    }
    
    func addWeek () -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = 7
        
        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }
    
    func subtractWeek () -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = -7
        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }
    
    func isToday() -> Bool {
        let today = Date()
        if today.convertToString(dateformat: .reverseDate) == self.convertToString(dateformat: .reverseDate) {
            return true
        }
        return false
    }
    
    func getDateRange (firstDay: Int, lastDay: Int) -> [Date] {

        var range = [Date]()
        var dateComponent = DateComponents()
        
        for number in (firstDay ... lastDay) {
            dateComponent.day = number
            range.append(self + dateComponent)
        }
        return range
    }
    
    // Date + DateComponents
    static func + (_ lhs: Date, _ rhs: DateComponents) -> Date
    {
        return Calendar.current.date(byAdding: rhs, to: lhs)!
    }
    
    
}
