# iOS-NSDate-Utilities
Powerful extensions for NSDate in Swift.

# Installation
  
Just add NSDate+Main.swift to your project for the main extension. It contains date creation, component getters. It is also required for other extra utility extensions inside the NSDate+Utilities folder. You can optionally add NSDate+Comparable.swift, NSDate+Periods.swift, NSDate+Count.swift, which are other extensions that make NSDate more powerful. However, if you don't need them, you don't need to add it to your project.

NSDate+Main also contains extensions for NSTimeInterval for time interval conversions, which is used by the NSDate extensions.

NSDate+Main also provides an NSDateUnit enum to enumerate Year, Month, Week, Day, Hour, Minute, Second values which is used in some functions in the extensions.

# Usage

## NSInterval extension:

    var seconds = 2.seconds // 2 (as NSTimeInterval)
    seconds = 3.minutes // 3*60 = 180
    seconds = 1.hours // 1*60*60 = 3600
    seconds = 1.days // 1*60*60*24 = 86400
    seconds = 1.weeks // 1*60*60*24*7 = 604800
    
    let howManyMinutesIn3600Seconds = 3600.count(.Minute) // 60.0 (as Double - since there is exactly 60 minutes in 3600 seconds)
    let minutes = 30.count(.Minute) // 0.5 (Half a minute)
    let hoursInWeek = 1.week.count(.Hour) // 168.0 (24 hours * 7 days)
    
    // You can use the rest of the NSDateUnit values to count the desired unit

## NSDate+Main.swift:

### NSDate Creation
    NSDate().calendar // Shortcut for NSCalendar.currentCalendar() - used in the extensions
    NSDate.dateWithYear(2015, month: 6, andDay: 28) // Creates date of June 28, 2015 at 12 AM
    NSDate.dateWithYear(2015, month: 1, day: 1, hour: 14, minute: 5, andSecond: 30) // Creates date of January 1, 2015 at 2:05:30 PM
    
    NSDate.today() // Today same time
    NSDate.tomorrow() // Tomorrow same time
    NSDate.yeasterday() // Yesterday same time
    
    NSDate.dateFromString(dateString: "03-30-2015", withFormat: "MM-dd-yyyy") // March 30, 2015 12AM
    
    let components = NSDateComponents()
    components.year = 2015
    components.month = 3
    components.day = 30
    
    NSDate.dateFromComponents(components) // March 30, 2015 12AM

### Components and Conversion
    NSDate.dateWithYear(2015, month: 11, andDay: 23).toStringWithFormat("MM-dd-yyyy") // "11-23-2015"
    
    let christmas = NSDate.dateWithYear(2015, month: 12, andDay: 25)
    christmas.getComponents(NSCalendarUnit.CalendarUnitDay).day // 25
    christmas.year // 2015
    christmas.month // 12
    christmas.day // 25
    christmas.hour // 0 - since it's 12:00:00 AM
    christmas.minute // 0
    christmas.second // 0
    

### Check relative date

    NSDate().isToday == true
    NSDate.tomorrow().isTomorrow == true
    NSDate.yesterday().isYesterday == true
    
    NSDate().isWeekend // Check if date is a weekend
    NSDate().isWeekday

## NSDate+Comparable.swift:

    let today = NSDate()
    today < NSDate.tomorrow() // True
    today > NSDate.yesterday() // True
    today == today // True
    today != NSDate.tomorrow()



# License
This software is licensed under the [MIT License](./LICENSE.md)
