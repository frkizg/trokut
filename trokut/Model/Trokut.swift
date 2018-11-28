//
//  trokut.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import Foundation

class Trokut: NSObject, NSCoding{
 
  
    var stranicaA : Double
    var stranicaB : Double
    var stranicaC : Double
    var datumStvaranja : NSDate

    func povrsinaTrokuta() -> Double {
        return (stranicaA * stranicaB) / 2
    }
    
    init(stranicaA: Double, stranicaB: Double, stranicaC: Double, datum: NSDate) {
        self.stranicaA = stranicaA
        self.stranicaB = stranicaB
        self.stranicaC = stranicaC
        self.datumStvaranja = datum
    }

    required convenience init(coder aDecoder: NSCoder) {
        let stranicaA = aDecoder.decodeDouble(forKey: "stranicaA")
        let stranicaB = aDecoder.decodeDouble(forKey: "stranicaB")
        let stranicaC = aDecoder.decodeDouble(forKey: "stranicaC")
        let datumStvaranja = aDecoder.decodeObject(forKey: "datumStvaranja") as! NSDate
        self.init(stranicaA: stranicaA, stranicaB: stranicaB, stranicaC: stranicaC, datum: datumStvaranja)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stranicaA, forKey: "stranicaA")
        aCoder.encode(stranicaB, forKey: "stranicaB")
        aCoder.encode(stranicaC, forKey: "stranicaC")
        aCoder.encode(datumStvaranja, forKey: "datumStvaranja")

    }
}
