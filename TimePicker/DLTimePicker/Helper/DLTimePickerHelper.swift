//
//  DLTimePickerHelper.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import Foundation

struct DLTimePickerHelper {
    
    init() {}
    
    func is24HourFormat() -> Bool {
        let locale = NSLocale.current
        let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        return !formatter.contains("a")
    }
    
    func calendar() -> Calendar {
        // get user's calendar base on their time zone and locale
        var currentCalendar = Calendar.current
        currentCalendar.timeZone = TimeZone.current
        currentCalendar.locale = Locale.current
        return currentCalendar
    }
    
    func time(from timeObject: DLTime) -> Date? {
        var myTimeObject = timeObject
        
        // convert 12h clock to 24h clock
        if myTimeObject.format == .twelveHour && myTimeObject.timeSymbol! == .pm {
            myTimeObject.hour += 12
        }
        
        let calendar = self.calendar()
        let calendarComponents: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute]
        
        // get current utc time
        var currentDateComponent = calendar.dateComponents(calendarComponents, from: Date())
        currentDateComponent.calendar = calendar
        let currentUTCTime = currentDateComponent.date!
        
        // get utc time from time picker
        var myDateComponent = currentDateComponent
        myDateComponent.hour = myTimeObject.hour
        myDateComponent.minute = myTimeObject.minute
        guard var myUTCTime = myDateComponent.date else { return nil }
        
        // return the next date time if the time in picker equal/smaller than the current time
        if Int(myUTCTime.timeIntervalSinceNow) <= Int(currentUTCTime.timeIntervalSinceNow) {
            let oneDayInSecond: Double = 60*60*24
            myUTCTime = myUTCTime.addingTimeInterval(oneDayInSecond)
        }
        
        return myUTCTime
    }
}
