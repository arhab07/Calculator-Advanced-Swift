//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
   private var isFinshedTyping : Bool = true
    
    private var displayValue: Double {
        get{
            guard let numbers =  Double(displayLabel.text!) else {
                fatalError("Cannot convert thios into double")
            }
            return numbers
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    private  var calculator = CalculatorLogic()
   
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinshedTyping = true
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
         
            if let result = calculator.calculat(sybmol: calcMethod){
             displayValue = result
        }
    
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numVale = sender.currentTitle{
            if isFinshedTyping {
            displayLabel.text = numVale
            isFinshedTyping = false
           
            }else{
               
                let isInt = floor(displayValue) == Double(displayValue)
             
                if !isInt{
                    return
                }
                displayLabel.text = displayLabel.text! + numVale
            }
            
    }

}
}
