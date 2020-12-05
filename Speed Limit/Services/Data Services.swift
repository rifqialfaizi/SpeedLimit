//
//  Data Services.swift
//  Speed Limit
//
//  Created by Rifqi Alfaizi on 03/11/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import Foundation

class DataService{
    // class harus dibuat subject agar dapat di akses
    // selalu pakai ()
        
    static let history = DataService()

    // Ini mau coba akses historySpeed dari SpeedLimitVC
        
    
    let speedFromSLVC = SpeedLimitVC.historySpeedForHistory
    var speedForDS: [Int] {
        speedFromSLVC.historySpeed }
    
    // Niatnya mau di taroh di bawah sini
    
    private let history = [
        History(speed: 20, duration: 20,time: "12.20",date: "Sunday, 2020 October 4th",street: "Jl. Tol Jakarta - Cikampek "),
        History(speed: 30, duration: 30,time: "13.20",date: "Sunday, 2020 October 5th",street: "Jl. Tol Jakarta - Cikampek "),
        History(speed: 40, duration: 50,time: "11.20",date: "Sunday, 2020 October 5th",street: "Jl. Tol Jakarta - Cikampek "),
        History(speed: 50, duration: 80,time: "10.20",date: "Sunday, 2020 October 5th",street: "Jl. Tol Jakarta - Cikampek "),
        History(speed: 60, duration: 20,time: "12.20",date: "Sunday, 2020 October 5th",street: "Jl. Tol Jakarta - Cikampek "),
        History(speed: 70, duration: 10,time: "15.20",date: "Sunday, 2020 October 5th",street: "Jl. Tol Jakarta - Cikampek "),
        History(speed: 80, duration: 60,time: "16.20",date: "Sunday, 2020 October 6th",street: "Jl. Tol Jakarta - Cikampek ")]
    
    func getHistory() -> [History] {
        return history
    }
    
}

