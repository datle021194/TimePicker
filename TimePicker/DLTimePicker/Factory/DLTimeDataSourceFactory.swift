//
//  DLTimeDataSourceFactory.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import Foundation

struct DLTimeDataSourceFactory {
    
    func timeDataSource(forType type: TimePickerFormatType) -> DLTimeDataSource {
        switch type {
        case .twelveHour:
            return DLTwelveTimeFormat()
        case .twentyFourHour:
            return DLTwentyFourTimeFormat()
        }
    }
}
