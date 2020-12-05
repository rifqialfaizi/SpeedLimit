//
//  History.swift
//  Speed Limit
//
//  Created by Rifqi Alfaizi on 03/11/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import Foundation

struct History {
    private(set) public var speed: Int
    private(set) public var duration: Int
    private(set) public var time: String
    private(set) public var date: String
    private(set) public var street: String
    
    init(speed: Int, duration: Int,time: String, date: String, street: String) {
        self.speed = speed
        self.duration = duration
        self.time = time
        self.date = date
        self.street = street
        
    }
}
