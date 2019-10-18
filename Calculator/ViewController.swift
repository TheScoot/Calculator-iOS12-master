//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double{
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can not get number from display")
            }
            return number
        }
        set {
            if newValue == 0.0{
                displayLabel.text = "0"
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let funcButton = sender.currentTitle {
            guard let calcedValue = CalculateLogic(number: displayValue).calculate(funcButton: funcButton) else {
                fatalError("Calculated Value returned nil")
            }
            displayValue = calcedValue
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numVal = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numVal
                isFinishedTypingNumber = false
            } else {
                if numVal == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt { return }
                }
                displayLabel.text = displayLabel.text! + numVal
            }
        }
    }

}

