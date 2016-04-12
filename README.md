# iOS - NSDate Utilities
Powerful extensions for NSDate in Swift.

# Installation

Import only what you need:
* NSDate+Main.swift - *required*
* NSDate+Comparable.swift
* NSDate+Periods.swift
* NSDate+Periods.swift

# Usage

## NSTimeInterval extension:

```swift
var seconds = 2.seconds // 2 (as NSTimeInterval)
seconds = 3.minutes // 3*60 = 180
seconds = 1.hours // 1*60*60 = 3600
seconds = 1.days // 1*60*60*24 = 86400
seconds = 1.weeks // 1*60*60*24*7 = 604800

let howManyMinutesIn3600Seconds = 3600.count(.Minute) // 60.0 (as Double - since there is exactly 60 minutes in 3600 seconds)
let minutes = 30.count(.Minute) // 0.5 (Half a minute)
let hoursInWeek = 1.week.count(.Hour) // 168.0 (24 hours * 7 days)

// You can use the rest of the NSDateUnit values to count the desired unit
```

## NSDate+Main.swift:

### NSDate Creation

```swift
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
```

### Components and Conversion

```swift
NSDate.dateWithYear(2015, month: 11, andDay: 23).toStringWithFormat("MM-dd-yyyy") // "11-23-2015"

let christmas = NSDate.dateWithYear(2015, month: 12, andDay: 25)
christmas.getComponents(NSCalendarUnit.CalendarUnitDay).day // 25
christmas.year // 2015
christmas.month // 12
christmas.day // 25
christmas.hour // 0 - since it's 12:00:00 AM
christmas.minute // 0
christmas.second // 0
```

### Check relative date

```swift
NSDate().isToday == true
NSDate.tomorrow().isTomorrow == true
NSDate.yesterday().isYesterday == true

NSDate().isWeekend // Check if date is a weekend
NSDate().isWeekday
```

## NSDate+Comparable.swift:

Compare dates using operators.

```swift
let today = NSDate()
today < NSDate.tomorrow() // True
today > NSDate.yesterday() // True
today == today // True
today != NSDate.tomorrow()
```

## NSDate+Periods.swift:

Get start, end, next, or previous of a unit (Year, Month, Day, Week, Hour, Minute, Second) of a date.

```swift
let date = NSDate.dateWithYear(2015, month: 10, day: 20, hour: 8, minute: 40, second: 9) // Oct 20, 2015 8:40:09 AM
date.startOf(.Day) // Oct 20, 2015 at 12 AM
date.startOf(.Month) // Oct 1, 2015, 12 AM
date.startOf(.Year) // Jan 1, 2015, 12 AM
// You can also use .Second, .Minute, .Hour, and .Week

date.endOf(.Day) // Oct 20, 2015 at 11:59:59 PM
date.endOf(.Month) // Oct 31, 2015, 11:59:59 PM
date.endOf(.Year) // Dec 31, 2015, 11:59:59 PM
// You can also use .Second, .Minute, .Hour, and .Week

date.next(.Day) // Oct 21, 2015 at 8:40:09 AM
date.next(.Month) // Nov 20, 2015, 8:40:09 AM
date.next(.Year) // Oct 20, 2016, 8:40:09 AM
// You can also use .Second, .Minute, .Hour, and .Week

date.previous(.Day) // Oct 19, 2015 at 8:40:09 AM
date.previous(.Month) // Sept 20, 2015, 8:40:09 AM
date.previous(.Year) // Oct 20, 2014, 8:40:09 AM
// You can also use .Second, .Minute, .Hour, and .Week
```

## NSDate+Count.swift

Count units from date to another date.

```swift
let today = NSDate()
let tomorrow = today.next(.Day)
today.count(.Day, toDate: tomorrow) // 1
today.preciseCount(.Day, toDate: tomorrow) // 1.0
today.count(.Hour, toDate: tomorrow) // 24

// Difference between count and preciseCount
let startOfDay = today.startOf(.Day)
let lunch = NSDate.dateWithYear(startOfDay.year, month: startOfMonth.month, day: startOfMonth.day, hour: 12, minute: 0, andSecond: 0)
startOfDay.count(.Day, toDate: lunch) // 0
startOfDay.preciseCount(.Day, toDate: lunch) // 0.5 (Half a day or 12 hours)
startOfDay.preciseCount(.Hour, toDate: lunch) // 12 (hours)
```

Count units from a larger unit based on a given date.

```swift
let daysInMonthToday = NSDate.count(.Day, inA: .Month, fromDate: NSDate.today()) // Count days in current month
let daysInYearToday = NSDate.preciseCount(.Day, inA: .Year, fromDate: NSDate.today()) // Count days in year precisely
```

## NSDate+RoundDown
### There is created by [YueJun1991](https://github.com/YueJun1991).
RoundDown any units you don't want.

```swift
var date_1 = NSDate().roundDownFrom(.Second)
var date_2 = NSDate().roundDownFrom(.Second)

date_1 <= date_2 // true
date_1 >= date_2 // true

date_1 < date_2 // false
date_1 > date_2 // false
```

# License
Copyright (c) 2015 Joe Christopher Paul Amanse. This software is distributed under the [MIT License](./LICENSE.md).
