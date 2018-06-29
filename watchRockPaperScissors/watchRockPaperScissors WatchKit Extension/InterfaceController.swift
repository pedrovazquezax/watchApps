//
//  InterfaceController.swift
//  watchRockPaperScissors WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 29/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

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
    
    
    @IBAction func chooseRock() {
        computeData(playerChoose: "👊🏻")
    }
    
    @IBAction func choosePaper() {
        computeData(playerChoose: "🖐🏻")
    }
    
    @IBAction func chooseScissors() {
        computeData(playerChoose: "✌🏻")
    }
    func computeData(playerChoose : String) {
        let gameArray = ["👊🏻","🖐🏻","✌🏻"]
        let cpuChoise = gameArray[Int(arc4random_uniform(3))]
        var result = ""
        
        if playerChoose == cpuChoise {
            result = "Tie"
        }else{
            switch playerChoose {
            case "👊🏻":
                if cpuChoise == "🖐🏻"{
                    result = "You lose ☹️"
                    
                }else{
                    result = "You Win 😁"
                    
                }
                break
            case "🖐🏻":
                if cpuChoise == "✌🏻"{
                    result = "You lose ☹️"
                    
                }else{
                    result = "You Win 😁"
                    
                }
                break
            case "✌🏻":
                if cpuChoise == "👊🏻"{
                    result = "You lose ☹️"
                    
                }else{
                    result = "You Win 😁"
                    
                }
                break
            default:
                result = "this is a big mistake"
            }
        }
        
        sendData(playerChoise: playerChoose, cpuChoise: cpuChoise, result: result)
        
        
    }
    func sendData(playerChoise:String,cpuChoise : String, result :String) {
        let data = ["playerChoise":playerChoise,"cpuChoise": cpuChoise,"result": result]
        pushController(withName: "result", context: data)
        
    }
    
}
