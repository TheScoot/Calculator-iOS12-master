//
//  CalculatedLogic.swift
//  Calculator
//
//  Created by Bedard, Scott on 10/17/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculateLogic {
    
    var number : Double
    
    init(number : Double){
        self.number = number
    }
    
    func calculate(funcButton : String) -> Double? {
        
        if funcButton == "+/-" {
            return number != 0.0 ? number * -1 : 0
        } else if funcButton == "%" {
            return number / 100
        } else if funcButton == "AC" {
            return 0.0
        }
        return nil
    }

}
