//
//  DLTwelveTimeFormat.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import Foundation

struct DLTwelveTimeFormat: DLTimeDataSource {
    
    private let hour = 12
    private let minute = 60
    private let numberRowOfHourComponent = 12000
    private let numberRowOfMinuteComponent = 60000
    private let numberRowOfLastComponent = 2 // last component: AM or PM
    
    private var timePickerHelper: DLTimePickerHelper?
    
    init() {}
    
    // MARK: - Public
    
    mutating func setHeler(_ helper: DLTimePickerHelper) {
        timePickerHelper = helper
    }
    
    func numberOfComponents() -> Int {
        return 3 // hour, minute and am/pm component
    }
    
    func numberOfRowsInComponent(_ component: Int) -> Int {
        if component == 0 { return numberRowOfHourComponent }
        
        if component == 1 { return numberRowOfMinuteComponent }
        
        return numberRowOfLastComponent
    }
    
    func title(forRow row: Int, component: Int) -> String {
        if component == 0 { return titleForHour(atRow: row) }
        
        if component == 1 { return titleForMinute(atRow: row) }
        
        return titleForLastComponent(atRow: row)
    }
    
    func centerHourRow() -> Int {
        let hourComponent = 0
        
        // because we plus 1 in titleForHour(atRow row: Int) to avoid the "0" value
        // so we subtract 1 to return correct value
        return numberOfRowsInComponent(hourComponent) / 2 - 1
    }
    
    func centerMinuteRow() -> Int {
        let minuteComponent = 1
        return numberOfRowsInComponent(minuteComponent) / 2
    }
    
    func date(forHour hour: String, minute: String) -> Date? {
        guard let helper = timePickerHelper else { return nil }
        return helper.date(forHour: hour, minute: minute)
    }
    
    // MARK: - Private
    
    private func titleForHour(atRow row: Int) -> String {
        // because 12h clock run around 1 to 12
        // so we plus 1 to avoid the "0" value
        // ex: 0...11 become 1...12
        return "\(row % hour + 1)"
    }
    
    private func titleForMinute(atRow row: Int) -> String {
        let minuteAtRow = row % minute
        
        // append "0" if minute smaller than 10
        // ex: 01, 02, ..., 09
        return (minuteAtRow < 10) ? "0\(minuteAtRow)" : "\(minuteAtRow)"
    }
    
    private func titleForLastComponent(atRow row: Int) -> String {
        return (row == 0) ? "AM" : "PM"
    }
}
