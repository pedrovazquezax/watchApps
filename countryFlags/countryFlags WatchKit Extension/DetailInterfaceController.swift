//
//  DetailInterfaceController.swift
//  countryFlags WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 29/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {
    let capitals = ["Belgium":"Brussels",
                    "USA":"Washington DC",
                    "UK":"London",
                    "India":"New Delhi",
                    "China":"Beijing",
                    "Australia":"Canberra",
                    "Mexico":"Mexico City"]
    let currencies = ["Belgium":"EUR",
                      "USA":"USD",
                      "UK":"GBP",
                      "India":"INR",
                      "China":"CNY",
                      "Australia":"AUD",
                      "Mexico":"MEX"]
    let flags = ["Belgium":"be",
                 "USA":"us",
                 "UK":"gb",
                 "India":"in",
                 "China":"cn",
                 "Australia":"au",
                 "Mexico":"mx"]
    @IBOutlet var currencyLabel: WKInterfaceLabel!
    @IBOutlet var capitalLabel: WKInterfaceLabel!
    @IBOutlet var countryImageView: WKInterfaceImage!
    @IBOutlet var countryNameLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        guard  let name = context as? String else {
            return
        }
        currencyLabel.setText(currencies[name])
        capitalLabel.setText(capitals[name])
        countryNameLabel.setText(name)
        countryImageView.setImageNamed(flags[name])
        
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
