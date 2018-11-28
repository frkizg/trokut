//
//  trokut.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import Foundation

struct Trokut {
 
    var stranicaA = 0.0
    var stranicaB = 0.0
    var stranicaC = 0.0
    let datumStvaranja = NSDate()
    
    func povrsinaTrokuta() -> Double {
        return (stranicaA * stranicaB) / 2
    }
}
