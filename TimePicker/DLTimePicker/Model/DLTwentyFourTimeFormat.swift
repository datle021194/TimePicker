//
//  DLTwentyFourTimeFormat.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import Foundation

struct DLTwentyFourTimeFormat: DLTimeDataSource {
    
    private let hour = 24
    private let minute = 60
    private let numberRowOfHourComponent = 24000
    private let numberRowOfMinuteComponent = 60000
    
    private var timePickerHelper: DLTimePickerHelper?
    
    init() {}
    
    // MARK: - Public
    
    mutating func setHeler(_ helper: DLTimePickerHelper) {
        timePickerHelper = helper
    }
    
    func numberOfComponents() -> Int {
        return 2 // hour and minute component
    }
    
    func numberOfRowsInComponent(_ component: Int) -> Int {
        return (component == 0) ? numberRowOfHourComponent : numberRowOfMinuteComponent
    }
    
    func title(forRow row: Int, component: Int) -> String {
        return (component == 0) ? titleForHour(atRow: row) : titleForMinute(atRow: row)
    }
    
    func centerHourRow() -> Int {
        let hourComponent = 0
        return numberOfRowsInComponent(hourComponent) / 2
    }
    
    func centerMinuteRow() -> Int {
        let minuteComponent = 1
        return numberOfRowsInComponent(minuteComponent) / 2
    }
    
    func time(from timeObject: DLTime) -> Date? {
        guard let helper = timePickerHelper else { return nil }
        return helper.time(from: timeObject)
    }
    
    // MARK: - Private
    
    private func titleForHour(atRow row: Int) -> String {
        return "\(row % hour)"
    }
    
    private func titleForMinute(atRow row: Int) -> String {
        let minuteAtRow = row % minute
        
        // append "0" if minute smaller than 10
        // ex: 01, 02, ..., 09
        return (minuteAtRow < 10) ? "0\(minuteAtRow)" : "\(minuteAtRow)"
    }
}
