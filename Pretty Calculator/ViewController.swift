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
    
    @IBAction func numberPressed(sender: UIButton) {
        buttonSound.play()
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
    }
    
    @IBAction func multiplyPressed(sender: AnyObject) {
    }
    
    @IBAction func subtractPressed(sender: AnyObject) {
    }
    
    @IBAction func additionPressed(sender: AnyObject) {
    }
    
    @IBAction func equalsPressed(sender: AnyObject) {
    }
    
    @IBAction func posNegPressed(sender: AnyObject) {
    }
    
    @IBAction func decimalPressed(sender: AnyObject) {
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
    }
    
    @IBAction func percentPressed(sender: AnyObject) {
    }
    
    @IBAction func exponentPressed(sender: AnyObject) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

