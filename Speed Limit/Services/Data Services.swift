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
        

    // value jadi shared karena bisa di akses semua class
    // value nya akan sama untuk semua class (Singleton Pattern) (Value itu isi dari static let nya)
    
    static let shared = DataService()

    
    // Buat Variable history kosongan ketika di buka pada saat awal app di buka
    
    private var history = [History]()
    
    
    func getHistory() -> [History] {
        return history
    }
 
    func addHistory(history: History) {
        self.history.append(history)
    }
    
    
}

