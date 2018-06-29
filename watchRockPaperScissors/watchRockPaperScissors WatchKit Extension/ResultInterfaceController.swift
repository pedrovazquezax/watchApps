//
//  ResultInterfaceController.swift
//  watchRockPaperScissors WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 29/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {

    @IBOutlet var playerChooseLabel: WKInterfaceLabel!
    @IBOutlet var cpuChooseLabel: WKInterfaceLabel!
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var background: WKInterfaceGroup!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        guard let data = context as? Dictionary<String,String> else {return}
        
        playerChooseLabel.setText(data["playerChoise"])
        cpuChooseLabel.setText(data["cpuChoise"])
        resultLabel.setText(data["result"])
        if data["result"] == "You Win 😁" {
            background.setBackgroundImage(#imageLiteral(resourceName: "winImage"))
        }else if data["result"] == "You lose ☹️"{
            background.setBackgroundImage(#imageLiteral(resourceName: "loseImage"))
        }else{
            background.setBackgroundImage(#imageLiteral(resourceName: "tieImage"))
        }
        
        // Configure interface objects here.
    }

    

}
