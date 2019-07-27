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
