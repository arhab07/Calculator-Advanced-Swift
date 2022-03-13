//
//  CalcilatorLogic.swift
//  Calculator
//
//  Created by Arhab Muhammad on 12/03/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import UIKit
struct CalculatorLogic{
   private var number: Double?
  private  var intermidiate: (n1: Double, operation: String)?
 mutating   func setNumber(_ number: Double) {
        self.number = number
    }
 
    
    mutating func calculat(sybmol: String) -> Double?{
        if let n = number{
        if sybmol == "+/-"{
     return n * -1
        }else if sybmol == "AC"{
           return 0
        }else if sybmol == "%"{
              return n / 100
        }else if sybmol == "="{
         return performTwoNumber(n2: n)
        }else{
            intermidiate = (n1: n , operation: sybmol)
        }
      
        }
        return nil
    }
    
    func performTwoNumber(n2: Double) -> Double?{
        if let n1 = intermidiate?.n1 , let opration = intermidiate?.operation{
//            if opration == "+"{
//                return n1 + n2
//            }else if opration == "-"{
//                return n1 - n2
//            }else if opration == "*"{
//                return n1 * n2
//            }else if opration == "/"{
//                return n1 / n2
//            }
            
            switch opration {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
               fatalError("Sysntx error")
            }
            
        }
    return nil
    }
    
}
