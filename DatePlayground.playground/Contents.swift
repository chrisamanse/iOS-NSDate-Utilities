//: Playground - noun: a place where people can play

import UIKit
@testable import NSDate_Extension

var date_1 = NSDate().roundDownFrom(.Second)
var date_2 = NSDate().roundDownFrom(.Second)

date_1 <= date_2
date_1 >= date_2

date_1 < date_2
date_1 > date_2

date_1 == date_2
date_1 != date_2