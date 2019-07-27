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
    
    func date(forHour hour: String, minute: String) -> Date? {
        guard let myHour = Int(hour), let myMinute = Int(minute) else { return nil }
        
        let calendar = self.calendar()
        
        // get current date
        let currentDate = Date()
        let calendarComponents: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second]
        let currentDateComponent = calendar.dateComponents(calendarComponents, from: currentDate)
        
        // get date from time picker
        var myDateComponent = currentDateComponent
        myDateComponent.hour = Int(myHour)
        myDateComponent.minute = Int(myMinute)
        myDateComponent.calendar = calendar
        
        guard var myDate = myDateComponent.date else { return nil}
        
        // return the next date if time in picker equal/smaller than current time
        if Int(myDate.timeIntervalSinceNow) <= Int(currentDate.timeIntervalSinceNow) {
            let oneDayInSecond: Double = 60*60*24
            myDate = myDate.addingTimeInterval(oneDayInSecond)
        }
        
        return myDate
    }
}
