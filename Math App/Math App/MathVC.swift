//
//  MathVC.swift
//  Math App
//
//  Created by Student on 5/28/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

class MathViewController : UIViewController{
    // Label
    @IBOutlet weak var lblNum1: UILabel!
    // Label
    @IBOutlet weak var lblSymbol: UILabel!
    // Label
    @IBOutlet weak var lblNum2: UILabel!
    // Label Correct
    @IBOutlet var lbl_Correct: UILabel!
    // Label Wrong
    @IBOutlet var lbl_Wrong: UILabel!
    // Text Field Label
    @IBOutlet weak var lbl_TextField: UILabel!
    // Textbox
    @IBOutlet weak var inputAnswer: UITextField!
//=====================================================================================
    var correctAnswer:UInt32? = 0
    var correctQuestion:UInt32 = 0
    var inCorrectQuestion:UInt32 = 0;
//=====================================================================================

    // Button To Get A New Problem
    @IBAction func btn_NewProblem(_ sender: UIButton) {
        let num1:UInt32?  = arc4random()%100
        var num2:UInt32?  = arc4random()%100
        let symbol:UInt32? = arc4random()%4
        
        switch(symbol){
        
        case(0):
            lblSymbol.text = "+"
            // Shows The Formula
            lblNum1.text = String(num1!)
            lblNum2.text = String(num2!)
            // Caculates It
            correctAnswer = (num1!+num2!)
            break;
        case(1):
            lblSymbol.text = "-"
            // Shows The Formula
            lblNum1.text = String(num1!)
            lblNum2.text = String(num2!)
            correctAnswer = (num1!-num2!)
            break;
        case(2):
            lblSymbol.text = "*"
            // Make Sure They Cannot Multply By Zero
            lblNum1.text = String(num1!)
            lblNum2.text = String(num2!)
            correctAnswer = (num1!*num2!)
            break;
        case(3):
            lblSymbol.text = "/"
            // Make Sure They Cannot Divide By Zero
            lblNum1.text = String(num1!)
            lblNum2.text = String(num2!)
            correctAnswer = UInt32(num1!/num2!)
            if(num1!==0 || num2! == 0){
                num2 = 1;
            }
            break;
        default:
            lblSymbol.text = "Please Contact Support Team"
            break;
        }
    }
    
      // Button To Check Answer
    @IBAction func btn_CheckAnswer(_ sender: Any) {
        // Get The Answer
        let answer:UInt32? = UInt32(inputAnswer.text!)
        if(answer == correctAnswer){
            lbl_TextField.text = "Congratulations! You Are Correct."
            correctQuestion += 1
            lbl_Correct.text = String(correctQuestion)
            
        }else{
             lbl_TextField.text = "Epic Fail... The Correct Answer is \(String(describing: correctAnswer))"
            inCorrectQuestion += 1
            lbl_Wrong.text = String(inCorrectQuestion)
  
        }

    }
    
   
    
    
}// END OF CLASS
