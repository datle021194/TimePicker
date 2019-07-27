//
//  ViewController.swift
//  TimePicker
//
//  Created by Dat Le on 7/26/19.
//  Copyright © 2019 Dat Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timePickerContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timePickerVC = DLTimePickerVC()
        addChild(timePickerVC)
        
        timePickerVC.view.frame = timePickerContainerView.bounds
        timePickerContainerView.addSubview(timePickerVC.view)
        
        timePickerVC.didMove(toParent: self)
    }
}
