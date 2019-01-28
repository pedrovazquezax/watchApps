//
//  DetailInterfaceController.swift
//  Project1 WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 1/26/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {

    @IBOutlet var textLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        if let contextDictionary = context as? [String: String]{
            textLabel.setText(contextDictionary["note"] ?? "")
            let sizeOf = contextDictionary["size"] ?? "0"
        let index = contextDictionary["index"] ?? "1"
            setTitle("Note \(index)/\(sizeOf)")
        //setTitle("Note \(index)/")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
