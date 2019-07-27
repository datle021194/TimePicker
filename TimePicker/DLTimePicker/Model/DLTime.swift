//
//  DLTime.swift
//  TimePicker
//
//  Created by Dat Le on 7/27/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import Foundation

enum DLTimeSymbol {
    case am
    case pm
}

struct DLTime {
    var hour: Int
    var minute: Int
    var format: DLTimeFormatType
    var timeSymbol: DLTimeSymbol?
    
    init() {
        hour = 0
        minute = 0
        format = .twentyFourHour
        timeSymbol = nil
    }
}
