//
//  ViewController.swift
//  Calculator
//
//  Created by Christopher Prater on 3/28/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var display: UILabel!
    
    private var userCurrentlyTyping = false
    
    @IBAction private func digitTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userCurrentlyTyping {
           let currentDisplayText = display.text!
           display.text = currentDisplayText + digit
        } else {
           display.text = digit
        }
        
        userCurrentlyTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
           display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()

    @IBAction private func operationTapped(_ sender: UIButton) {
        if userCurrentlyTyping {
            brain.setOperand(operand: displayValue)
            userCurrentlyTyping = false
        }
        if let symbol = sender.currentTitle {
            brain.preformOperation(symbol: symbol)
        }
        
        displayValue = brain.result
    }
}

