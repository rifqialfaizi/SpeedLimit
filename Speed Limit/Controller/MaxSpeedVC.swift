//
//  MaxSpeedVC.swift
//  Speed Limit
//
//  Created by Rifqi Alfaizi on 20/01/21.
//  Copyright © 2021 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class MaxSpeedVC: UIViewController {

    @IBOutlet weak var speedTextField: UITextField!
    
    
    let speed = ["10","20","30","40","50","60","70","80","90","100","110","120","130","140","150"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        speedTextField.inputView = pickerView

    }
    
}

extension MaxSpeedVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speed.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return speed[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        speedTextField.text = speed[row]
        speedTextField.resignFirstResponder()
    }
    
    
    
    
    
}
