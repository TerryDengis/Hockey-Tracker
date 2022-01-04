//
//  Extensions+Date.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import Foundation

/// Date Format type
enum DateFormatType: String {
    case time = "HH:mm:ss"
    case timeAM = "h:mm a"
    case dateWithTime = "dd-MMM-yyyy  h:mm a"
    case date = "dd-MMM-yyyy"
    case reverseDate = "yyyy-MM-dd"
    case shortDate = "MMM dd"
    case day = "EEEE, MMM d, yyyy"
    //20220102203000 -0800
    //yyyymmddhhmmss Z
}

extension Date {
    func convertToString(dateformat formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = formatType.rawValue
        
        return dateFormatter.string(from: self)
    }
    
    func addDay () -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = 1
        
        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }
    
    func subtractDay () -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = -1
        return Calendar.current.date(byAdding: dateComponent, to: self)!
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
