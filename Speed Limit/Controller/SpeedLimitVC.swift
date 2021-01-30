//
//  SpeedLimitVC.swift
//  Speed Limit
//
//  Created by Rifqi Alfaizi on 09/10/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SpeedLimitVC: UIViewController {
    
    static let historySpeedForHistory = SpeedLimitVC()

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var maxSpeedTextField: UITextField!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var alertBG: UIView!
    
    
    let manager = CLLocationManager()
    let speed = ["10","20","30","40","50","60","70","80","90","100","110","120","130","140","150"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
       // duration = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("timerCount")), userInfo: nil, repeats: true)
        
        duration = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCount), userInfo: nil, repeats: true)
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        maxSpeedTextField.inputView = pickerView
        
    }
    


    var duration = Timer()
    var time = 0
    var speedSpeed = 0
    var isOverLimit = false
    
    var lastSpeed = 0
    var lastDuration = 0

    var historyDuration = [Int]()
    var historySpeed = [Int]()
    
    func getHistorySpeed(speed: Int) -> [Int] {
        return historySpeed
    }
    
    @IBAction func setMaxSpeed(_ sender: Any) {
 
        
    }
    
}


extension SpeedLimitVC: CLLocationManagerDelegate {
    
    
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations.first!
        let stringSpeed = String(format: "%.0f", location.speed)
        speedLabel.text = "\(stringSpeed)"
        checkSpeedLimit(Int(location.speed))
    }
    
    func checkSpeedLimit(_ speed: Int) {

        if speed > 5 {
            
            warningLabel.text = "Too Fast!"
            
            alertBG.backgroundColor = UIColor.red.withAlphaComponent(0.7)
            
            print("Too Fast! Your current speed is \(speed)")
            
            isOverLimit = true
        } else if speed < 3 {
            
            alertBG.backgroundColor = UIColor.clear
           
            
            warningLabel.text = "Not Fast!"
            
            isOverLimit = false
        }
        speedSpeed = speed
    }

    @objc func timerCount() {
        if isOverLimit == true {
             time += 1
            
            lastSpeed = speedSpeed
            lastDuration = time
            
        } else {
            if lastDuration > 0 {
                historySpeed.append(lastSpeed)
                historyDuration.append(lastDuration)
                saveHistory(withSpeed: lastSpeed, andDuration: lastDuration)
                lastDuration = 0
                lastSpeed = 0
            }
            time = 0
        }
        durationLabel.text = String(time)
        
        print("last Speed \(lastSpeed)")
        print("last duration  \(lastDuration)")
        print("History Duration \(historyDuration)")
        print("History Speed \(historySpeed)")
        
    }
    
    // cara ambil jalan
    private func saveHistory(withSpeed speed: Int, andDuration duration: Int) {
        let date = getCurrentDate()
        let time = getCurrentTime()
        let street = "Jl. Tol Jakarta - Cikampek"
        let history = History(speed: speed, duration: duration, time: time, date: date, street: street)
        
        DataService.shared.addHistory(history: history)
    }
    
    // Date formatternya bisa diliat di sini :https://nsdateformatter.com
    
    private func getCurrentTime() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    
    
    
}

extension SpeedLimitVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speed.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        speed[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        maxSpeedTextField.text = speed[row]
        maxSpeedTextField.resignFirstResponder()
    }
}


