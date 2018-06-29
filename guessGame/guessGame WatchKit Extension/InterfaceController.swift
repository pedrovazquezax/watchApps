//
//  InterfaceController.swift
//  guessGame WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 29/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var sliderGuess: WKInterfaceSlider!
    
    @IBOutlet var guessLabel: WKInterfaceLabel!
    @IBOutlet var guessResult: WKInterfaceLabel!
    var guessNumber = 0
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    @IBAction func guessUpdate(_ value: Float) {
        guessNumber = Int(value)
        guessLabel.setText("Your Guess: \(guessNumber)")
    }
    
    @IBAction func guessPlay() {
        
        let randomNumber = Int(arc4random_uniform(6))
        
        if(guessNumber == randomNumber) {
            guessResult.setText("Correct. You win!")
            
        } else {
            guessResult.setText("Wrong. The number is \(randomNumber)")
        }
    }
    

}
