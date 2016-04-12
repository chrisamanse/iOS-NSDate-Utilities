//
//  NSDate+RoundDown.swift
//  NSDate_Extensions
//
//  Created by ViViViViViVi on 2016/4/12.
//  Copyright © 2016年 Joe Christopher Paul Amanse. All rights reserved.
//

import Foundation

extension NSDate {
    
    func roundDownFrom(unit: NSDateUnit) -> NSDate? {
        switch unit {
        case .Second:
            return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: self.hour, minute: self.minute, andSecond: 0)
        case .Minute:
            return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: self.hour, minute: 0, andSecond: 0)
        case .Hour:
            return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: 0, minute: 0, andSecond: 0)
        case .Day:
            return NSDate.dateWithYear(self.year, month: self.month, day: 1, hour: 0, minute: 0, andSecond: 0)
        case .Month:
            return NSDate.dateWithYear(self.year, month: 1, day: 1, hour: 0, minute: 0, andSecond: 0)
        default:
            return nil
        }
    }
}