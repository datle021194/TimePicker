//
//  DLTimeDataSource.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import Foundation

protocol DLTimeDataSource {
    mutating func setHeler(_ helper: DLTimePickerHelper)
    func numberOfComponents() -> Int
    func numberOfRowsInComponent(_ component: Int) -> Int
    func title(forRow: Int, component: Int) -> String
    func centerHourRow() -> Int
    func centerMinuteRow() -> Int
    func time(from timeObject: DLTime) -> Date?
}
