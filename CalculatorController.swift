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
    @IBOutlet weak var dismissCalculatorOutlet: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var firstDigit = 0
    var secondDigit = 0
    var operatorPluss = false
    var operatorMinus = false
    
    
    var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.reversesTitleShadowWhenHighlighted = true
        for everyButton in funcButtons {
            everyButton.layer.cornerRadius = 8
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func trueForDigit(digitTitle: String) ->Bool {
        
        for i in 0...9 {
            if digitTitle == String(i) {
                return true
            }
        }
        return false
    }
    
    @IBAction func touchDigit(sender: UIButton)
        
    {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = calculatorDisplay.text!
            calculatorDisplay.text = textCurrentlyInDisplay + digit
        } else {
            calculatorDisplay.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
        if digit == "CE" {
            calculatorDisplay.text = nil
            
        }
        
        
        funcButtons[2].tintColor = UIColor(red:0.00, green:0.63, blue:0.75, alpha:1.0)
        funcButtons[1].tintColor = UIColor(red:0.00, green:0.63, blue:0.75, alpha:1.0)

        
        

    }
    
    
    
    @IBAction func operatorPressed(sender: UIButton) {
        if calculatorDisplay.text == "" {
        } else {
        firstDigit = Int(calculatorDisplay.text!)!
        
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
       

        secondDigit = Int(calculatorDisplay.text!)!
        var answer = 1337
        
        if operatorMinus {
            answer = firstDigit - secondDigit
        } else {
            answer = firstDigit + secondDigit
        }
        calculatorDisplay.text = String(answer)
            operatorMinus = false
            operatorPluss = false
            firstDigit = 0
            secondDigit = 0
        }}
    
    
    @IBAction func dismissCalculator(sender: UIButton) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    

}
