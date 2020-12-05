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
    @IBOutlet weak var maxSpeedLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        duration = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("timerCount")), userInfo: nil, repeats: true)
 
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
}

extension SpeedLimitVC: CLLocationManagerDelegate {
    
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    let location = locations.first!

        let stringSpeed = String(format: "%.0f", location.speed)
        
        speedLabel.text = "\(stringSpeed)"
        
        checkSpeedLimit(Int(location.speed))
        
    }
    
    func checkSpeedLimit(_ speed: Int) {
        
        
        if speed > 3 {
            print("Too Fast! Your current speed is \(speed)")
            
            isOverLimit = true
            

        } else {
            
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
    
    
}
