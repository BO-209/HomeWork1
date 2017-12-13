//
//  ViewController.swift
//  MyCalculator
//
//  Created by Admin on 18.11.17.
//  Copyright © 2017 Bo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstOperand : Double = 0
    var secondOperand : Double = 0
    var singOperator : String = ""
    var firstPressed : Bool = false
   
    @IBOutlet weak var calcDisplay: UILabel!
    
    
    @IBAction func numbPress(_ sender: UIButton) {
        let number = sender.currentTitle!
        if (firstPressed == false) {
            calcDisplay.text = number
            firstPressed = true
        }
        else {
		calcDisplay.text = calcDisplay.text! + number
		}
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        
        firstOperand = Double(calcDisplay.text!)!
        firstPressed = false
        calcDisplay.text = "0"
        singOperator = sender.currentTitle!
    
    }
    
    func operateTwoOperands(operation: (Double, Double)-> Double){
        calcDisplay.text = String(operation(firstOperand, secondOperand))
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        
        secondOperand = Double(calcDisplay.text!)!
        switch singOperator {
        case "+":
            operateTwoOperands{$0 + $1}
        case "-":
            operateTwoOperands{$0 - $1}
        case "x":
            operateTwoOperands{$0 * $1}
        case "÷":
            operateTwoOperands{$0 / $1}
        default: break
        }
		
		firstPressed = false
    }
    
    @IBAction func deletePress(_ sender: UIButton) {
        calcDisplay.text = "0"
        firstOperand = 0
        secondOperand = 0
        singOperator = ""
        firstPressed = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  


}

