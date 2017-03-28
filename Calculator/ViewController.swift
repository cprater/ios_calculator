//
//  ViewController.swift
//  Calculator
//
//  Created by Christopher Prater on 3/28/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userCurrentlyTyping = false
    
    @IBAction func digitTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userCurrentlyTyping {
           let currentDisplayText = display.text!
           display.text = currentDisplayText + digit
        } else {
           display.text = digit
        }
        
        userCurrentlyTyping = true
    }

    @IBAction func operationTapped(_ sender: UIButton) {
        if let symbol = sender.currentTitle {
            if symbol == "π" {
                display.text = String(M_PI)
                userCurrentlyTyping = false
            }
        }
    }
}

