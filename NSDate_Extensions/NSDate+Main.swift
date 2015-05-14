//
//  NSDate+Main.swift
//  NSDate_Extensions
//
//  Created by Chris Amanse on 5/12/15.
//  Copyright (c) 2015 Joe Christopher Paul Amanse. All rights reserved.
//
//  This code is licensed under the MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

// MARK: - NSDate Units

enum NSDateUnit: Int {
    case Second = 1
    case Minute
    case Hour
    case Day
    case Week
    case Month
    case Year
}

// MARK: - NSTimeInterval Utilities
extension NSTimeInterval {
    var seconds: NSTimeInterval {
        return self
    }
    var minutes: NSTimeInterval {
        return self * 60
    }
    var hours: NSTimeInterval {
        return self.minutes * 60
    }
    var days: NSTimeInterval {
        return self.hours * 24
    }
    var weeks: NSTimeInterval {
        return self.days * 7
    }
    
    func count(unit: NSDateUnit) -> Double {
        switch unit {
        case .Second:
            return self
        case .Minute:
            return self / 1.minutes
        case .Hour:
            return self / 1.hours
        case .Day:
            return self / 1.days
        case .Week:
            return self / 1.weeks
        case .Month:
            return self / 31.days // Inaccurate - not all months have 31 days, maybe modify to get days in current month?
        case .Year:
            return self / 365.days // Inaccurate - not all years have 365 days
        }
    }
}

// MARK: - NSDate Utilities

extension NSDate {
    // For shorter call of current calendar within NSDate instance
    var calendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
    
    // MARK: - Date Creation
    class func dateWithYear(year: Int, month: Int, andDay day: Int) -> NSDate? {
        let components = NSDateComponents()
        components.month = month
        components.day = day
        components.year = year
        
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    class func dateWithYear(year: Int, month: Int, day: Int, hour: Int, minute: Int, andSecond second: Int) -> NSDate? {
        let components = NSDateComponents()
        components.month = month
        components.day = day
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    
    class func dateFromString(dateString: String, withFormat format: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(dateString)
    }
    class func dateFromComponents(components: NSDateComponents) -> NSDate? {
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    
    class func today() -> NSDate {
        return NSDate()
    }
    class func yesterday() -> NSDate {
        return NSDate().dateByAddingTimeInterval(-1.days)
    }
    class func tomorrow() -> NSDate {
        return NSDate().dateByAddingTimeInterval(1.days)
    }
    
    // MARK: - Conversion
    func toStringWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
    
    // MARK: - Components using Units
    func getComponents(unitFlags: NSCalendarUnit) -> NSDateComponents {
        return calendar.components(unitFlags, fromDate: self)
    }
    
    // MARK: Calendar Units
    var era: Int {
        return calendar.component(.CalendarUnitEra, fromDate: self)
    }
    var year: Int {
        return calendar.component(.CalendarUnitYear, fromDate: self)
    }
    var month: Int {
        return calendar.component(.CalendarUnitMonth, fromDate: self)
    }
    var day: Int {
        return calendar.component(.CalendarUnitDay, fromDate: self)
    }
    var hour: Int {
        return calendar.component(.CalendarUnitHour, fromDate: self)
    }
    var minute: Int {
        return calendar.component(.CalendarUnitMinute, fromDate: self)
    }
    var second: Int {
        return calendar.component(.CalendarUnitSecond, fromDate: self)
    }
    var weekday: Int {
        return calendar.component(.CalendarUnitWeekday, fromDate: self)
    }
    var weekdayOrdinal: Int {
        return calendar.component(.CalendarUnitWeekdayOrdinal, fromDate: self)
    }
    var quarter: Int {
        return calendar.component(.CalendarUnitQuarter, fromDate: self)
    }
    var weekOfMonth: Int {
        return calendar.component(.CalendarUnitWeekOfMonth, fromDate: self)
    }
    var weekOfYear: Int {
        return calendar.component(.CalendarUnitWeekOfYear, fromDate: self)
    }
    var nanosecond: Int {
        return calendar.component(.CalendarUnitNanosecond, fromDate: self)
    }
    
    var isToday: Bool {
        return calendar.isDateInToday(self)
    }
    var isTomorrow: Bool {
        return calendar.isDateInTomorrow(self)
    }
    var isYesterday: Bool {
        return calendar.isDateInYesterday(self)
    }
    var isWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }
    var isWeekday: Bool {
        return !isWeekend
    }
}
