//
//  NSDate+Periods.swift
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

extension NSDate {
    func startOf(unit: NSDateUnit) -> NSDate {
        switch unit {
        case .Second:
            return NSDate.dateWithYear(year, month: month, day: day, hour: hour, minute: minute, andSecond: second)!
        case .Minute:
            return NSDate.dateWithYear(year, month: month, day: day, hour: hour, minute: minute, andSecond: 0)!
        case .Hour:
            return NSDate.dateWithYear(year, month: month, day: day, hour: hour, minute: 0, andSecond: 0)!
        case .Day:
            return calendar.startOfDayForDate(self)
        case .Week:
            let components = NSDateComponents()
            components.year = year
            components.month = month
            components.weekOfMonth = weekOfMonth
            components.weekday = 1
            
            return calendar.dateFromComponents(components)!
        case .Month:
            return NSDate.dateWithYear(year, month: month, andDay: 1)!
            
        case .Year:
            return NSDate.dateWithYear(year, month: 1, andDay: 1)!
        }
    }
    
    func endOf(unit: NSDateUnit) -> NSDate {
        switch unit {
        case .Second:
            let components = NSDateComponents()
            components.year = year
            components.month = month
            components.day = day
            components.hour = hour
            components.minute = minute
            components.second = second
            components.nanosecond = 999999999
            
            return calendar.dateFromComponents(components)!
        case .Minute:
            return NSDate.dateWithYear(year, month: month, day: day, hour: hour, minute: minute, andSecond: 59)!
        case .Hour:
            return NSDate.dateWithYear(year, month: month, day: day, hour: hour, minute: 59, andSecond: 59)!
        case .Day:
            return NSDate.dateWithYear(year, month: month, day: day, hour: 23, minute: 59, andSecond: 59)!
        case .Week:
            let components = NSDateComponents()
            components.year = year
            components.month = month
            components.weekOfMonth = weekOfMonth
            components.weekday = 7
            components.hour = 23
            components.minute = 59
            components.second = 59
            
            return calendar.dateFromComponents(components)!
        case .Month:
            let daysInMonth = calendar.rangeOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitMonth, forDate: self).length
            
            return NSDate.dateWithYear(year, month: month, day: daysInMonth, hour: 23, minute: 59, andSecond: 59)!
        case .Year:
            return NSDate.dateWithYear(year, month: 12, day: 31, hour: 23, minute: 59, andSecond: 59)!
        }
    }
    
    func next(unit: NSDateUnit) -> NSDate {
        switch unit {
        case .Second:
            return self.dateByAddingTimeInterval(1.seconds)
        case .Minute:
            return self.dateByAddingTimeInterval(1.minutes)
        case .Hour:
            return self.dateByAddingTimeInterval(1.hours)
        case .Day:
            return self.dateByAddingTimeInterval(1.days)
        case .Week:
            return self.dateByAddingTimeInterval(1.weeks)
        case .Month:
            return NSDate.dateWithYear(year, month: month+1, day: day, hour: hour, minute: minute, andSecond: second)!
        case .Year:
            return NSDate.dateWithYear(year+1, month: month, day: day, hour: hour, minute: minute, andSecond: second)!
        }
    }
    func previous(unit: NSDateUnit) -> NSDate {
        switch unit {
        case .Second:
            return self.dateByAddingTimeInterval(-1.seconds)
        case .Minute:
            return self.dateByAddingTimeInterval(-1.minutes)
        case .Hour:
            return self.dateByAddingTimeInterval(-1.hours)
        case .Day:
            return self.dateByAddingTimeInterval(-1.days)
        case .Week:
            return self.dateByAddingTimeInterval(-1.weeks)
        case .Month:
            return NSDate.dateWithYear(year, month: month-1, day: day, hour: hour, minute: minute, andSecond: second)!
        case .Year:
            return NSDate.dateWithYear(year-1, month: month, day: day, hour: hour, minute: minute, andSecond: second)!
        }
    }
}
