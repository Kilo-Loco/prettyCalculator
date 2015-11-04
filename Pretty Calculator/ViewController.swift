//
//  ViewController.swift
//  Pretty Calculator
//
//  Created by Kyle Lee on 11/2/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var buttonSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var currentOperation: Operation = Operation.Clear
    var result = ""
    
    
    @IBOutlet var displayText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("beep-08b", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playSound() {
        if buttonSound.playing == true {
            buttonSound.stop()
        }
        
        buttonSound.play()
    }
    
    func processOperation(op: Operation) {
        buttonSound.play()
        
        if currentOperation != Operation.Clear {
            if runningNumber != "" {
                rightValueString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Divide {
                    result = "\(Double(leftValueString)! / Double(rightValueString)!)"
                } else if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValueString)! * Double(rightValueString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValueString)! - Double(rightValueString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValueString)! + Double(rightValueString)!)"
                } else if currentOperation == Operation.PosNeg {
                    runningNumber = "\(Double(runningNumber)! * (-1))"
                    //displayText.text = "\(result)"
                } else if currentOperation == Operation.Decimal {
                    if runningNumber.rangeOfString(".") == nil {
                        runningNumber += "."
                    }
                } else if currentOperation == Operation.Clear {
                    result = "\(Double(leftValueString)! * 0)"
                    print("pressed clear")
                } else if currentOperation == Operation.Percentage {
                    runningNumber = "\(Double(runningNumber)!%%)"
                } else if currentOperation == Operation.Exponent {
                    result = "\(Double(leftValueString)! ** Double(rightValueString)!)"
                }
                
                leftValueString = result
                displayText.text = result
            }
            currentOperation = op
            
            
        } else {
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        buttonSound.play()
        
        runningNumber += "\(sender.tag)"
        displayText.text = runningNumber
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func multiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func subtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func additionPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func equalsPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func posNegPressed(sender: AnyObject) {
        processOperation(Operation.PosNeg)
    }
    
    @IBAction func decimalPressed(sender: AnyObject) {
        processOperation(Operation.Decimal)
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        processOperation(Operation.Clear)
    }
    
    @IBAction func percentPressed(sender: AnyObject) {
        processOperation(Operation.Percentage)
    }
    
    @IBAction func exponentPressed(sender: AnyObject) {
        processOperation(Operation.Exponent)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

