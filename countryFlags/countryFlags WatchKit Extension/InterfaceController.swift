//
//  InterfaceController.swift
//  countryFlags WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 29/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var countries = ["Belgium", "USA", "UK", "India", "China", "Australia","Mexico"]
    @IBOutlet var tableView: WKInterfaceTable!
   
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        setUpTable()
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
    func setUpTable(){
        
        tableView.setNumberOfRows(countries.count, withRowType: "CountryRow")
        for i in 0...(countries.count-1) {
            if let row = tableView.rowController(at: i) as? CountryRow {
                row.countryName.setText(countries[i])
            }
        }
    }
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        self.pushController(withName: "showDetails", context: countries[rowIndex])
    }
  
}
