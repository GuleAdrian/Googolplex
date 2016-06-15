//
//  CalculatorController.swift
//  Googolplex
//
//  Created by Adrian Evensen on 10/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
    @IBOutlet weak var calculatorDisplay: UITextField!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var funcButtons: [UIButton]!
    @IBOutlet weak var doneButton: UIButton!
    
    var firstDigit = 0.0
    var secondDigit = 0.0
    var operatorPluss = false
    var operatorMinus = false
    
    var squaredRoot = false
    var squared = false
    
    var multiply = false
    var divide = false
    
    
    var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = calculatorDisplay.text!
            calculatorDisplay.text = textCurrentlyInDisplay + digit
        } else {
            calculatorDisplay.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    
    
    @IBAction func operatorPressed(sender: UIButton) {
        if calculatorDisplay.text == "" {
        } else {
        firstDigit = Double(calculatorDisplay.text!)!
        
        if sender.currentTitle == "+" {
            operatorPluss = true
            operatorMinus = false
        } else {
            operatorMinus = true
            operatorPluss = false
        }
        
        sender.tintColor = UIColor.whiteColor()
        calculatorDisplay.text = nil
        }}
    
    
    @IBAction func equalsPressed(sender: UIButton) {
        if calculatorDisplay.text == "" {
        } else {
       

        secondDigit = Double(calculatorDisplay.text!)!
        var answer = secondDigit
        
        if operatorMinus {
            answer = firstDigit - secondDigit
        }
        if operatorPluss {
            answer = firstDigit + secondDigit
        }
        if squared {
            answer = pow(firstDigit, secondDigit)
        }
        if squaredRoot {
            answer = sqrt(secondDigit)
        }
        if multiply {
            answer = firstDigit * secondDigit
        }
        if divide {
            answer = firstDigit / secondDigit
        }
            
            
        calculatorDisplay.text = String(answer)
            operatorMinus = false
            operatorPluss = false
            
            squaredRoot = false
            squared = false
            
            multiply = false
            divide = false
            
            firstDigit = 0
            secondDigit = 0
        
            
            for everyButton in funcButtons {
                everyButton.tintColor = UIColor(red:0.00, green:0.63, blue:0.75, alpha:1.0)
            }

            
            
        }}
    
    @IBAction func squaringButtons(sender: UIButton) {
        
        if calculatorDisplay.text == "" {
            if sender.currentTitle == "√"{
                squaredRoot = true
            }
        }else{

            if sender.currentTitle == "√" {
                squared = false
                squaredRoot = true
            }else{
                firstDigit = Double(calculatorDisplay.text!)!
                squared = true
                squaredRoot = false
            }
            
            sender.tintColor = UIColor.whiteColor()
            calculatorDisplay.text = nil

        }}
    
    
    @IBAction func deleteButton(sender: UIButton) {
        calculatorDisplay.text = ""
    }
    
    
    @IBAction func multiplyAndDivide(sender: UIButton) {
        
        if calculatorDisplay.text == "" {
            
        } else {
            firstDigit = Double(calculatorDisplay.text!)!
            
            if sender.currentTitle == "×" {
                multiply = true
                divide = false
            } else {
                multiply = false
                divide = true
                
            }
            sender.tintColor = UIColor.whiteColor()
            calculatorDisplay.text = nil
        }
        
        
        
    }
    
 
    @IBAction func dismissCalculator(sender: UIButton) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func dismissTap(sender: UITapGestureRecognizer) {
        
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
