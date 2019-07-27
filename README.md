# TimePicker
a simple time picker created based on UIPickerView

![Alt text](https://github.com/datle021194/TimePicker/blob/master/Screenshot/ScreenShot.png?raw=true "example 1")

# Usage Example
```swift
let timePickerVC = DLTimePickerVC()
addChild(timePickerVC)

timePickerVC.view.frame = timePickerContainerView.bounds
timePickerContainerView.addSubview(timePickerVC.view)

timePickerVC.didMove(toParent: self)
```

# Custom timepicker value

Default the timepicker set the current time. You can change timepicker to your value by pass a Date to it:
```swift
let tenMinutesInSecond = 600.0
let myDate = Date(timeIntervalSinceNow: tenMinutesInSecond)
timePickerVC.setTimePickerToDate(myDate)
```

# Get timepicker value
```swift
timePickerVC.timePickerValue() // return Date
```
TimePicker return a Date, if the time in picker is equal or smaller than current time then the return value will return the time of next date
