//
//  DLTimePickerVC.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import UIKit

enum TimePickerFormatType {
    case twelveHour
    case twentyFourHour
}

class DLTimePickerVC: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var timeDataSource: DLTimeDataSource!
    private lazy var timePickerHelper = DLTimePickerHelper()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timeFormatType: TimePickerFormatType = timePickerHelper.is24HourFormat() ? .twentyFourHour : .twelveHour
        
        timeDataSource = DLTimeDataSourceFactory().timeDataSource(forType: timeFormatType)
        timeDataSource.setHeler(timePickerHelper)
        
        setTimePickerToDate(Date(), timeFormatType: timeFormatType)
    }
    
    // MARK: - Public
    
    func setTimePickerToDate(_ date: Date, timeFormatType: TimePickerFormatType) {
        let calendar = timePickerHelper.calendar()
        
        // get hour and minute from date parameter
        let dateComponent = calendar.dateComponents([.hour, .minute], from: date)
        let hour = dateComponent.hour
        let minute = dateComponent.minute
        
        guard hour != nil && minute != nil else { return }
        
        // get the center row for hour and minute component
        let hourRow = hour! + timeDataSource.centerHourRow()
        let minuteRow = minute! + timeDataSource.centerMinuteRow()
        
        jumpTimePicker(toHourRow: hourRow, minuteRow: minuteRow)
        
        if timeFormatType == .twelveHour {
            select12hClockUnit(withHour: hour!)
        }
    }
    
    func timePickerValue() -> Date? {
        let hourComponent = 0
        let minuteComponent = 1
        let hourRow = pickerView.selectedRow(inComponent: hourComponent)
        let minuteRow = pickerView.selectedRow(inComponent: minuteComponent)
        
        let hour = timeDataSource.title(forRow: hourRow, component: hourComponent)
        let minute = timeDataSource.title(forRow: minuteRow, component: minuteComponent)
        
        return timeDataSource.date(forHour: hour, minute: minute)
    }
    
    // MARK: - Private
    
    private func jumpTimePicker(toHourRow hourRow: Int, minuteRow: Int) {
        let hourComponent = 0
        let minuteComponent = 1
        
        // jump hour and minute component to the center row in picker view
        pickerView.selectRow(hourRow, inComponent: hourComponent, animated: false)
        pickerView.selectRow(minuteRow, inComponent: minuteComponent, animated: false)
    }
    
    private func select12hClockUnit(withHour hour: Int) {
        // for case 12h format: set the last component to am or pm
        // hour < 12: am - hour >= 12: pm
        let amPMSymbolRow = hour < 12 ? 0 : 1
        let amPMSymbolComponent = 2
        pickerView.selectRow(amPMSymbolRow, inComponent: amPMSymbolComponent, animated: false)
    }
}

extension DLTimePickerVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return timeDataSource.numberOfComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeDataSource.numberOfRowsInComponent(component)
    }
}

extension DLTimePickerVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeDataSource.title(forRow: row, component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}
