//
//  InterfaceController.swift
//  Proyect3 WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 1/28/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        testUserDefaults()
        testUserDefaults()
        testKeychain()
        testKeychain()
        testFile()
        testFile()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func testUserDefaults(){
        // get hold of our apps users defaults
        let defaults  = UserDefaults.standard
        if let contents = defaults.string(forKey: "shared_default"){
        //save data was found!
        print("Reasing from defaults")
        print(contents)
        
        } else {
            // no saved data was found - create it!
            print("Writing to defaults")
            defaults.set("This is the saved default.", forKey: "shared_default")
        }
    }
    func testKeychain(){
        let keychain = KeychainWrapper.standard
        if let contents = keychain.string(forKey: "shared_keychain"){
            print("Reading from keychain")
            print(contents)
        }else{
            print("Writting yo keychain")
            keychain.set("This is the saved keychain.", forKey: "shared_keychain")
        }
    }
    
    func getDocumetsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func testFile(){
        let saveURL = getDocumetsDirectory().appendingPathComponent("shared_file")
        if let contents = try? String(contentsOf: saveURL){
            print("reading from File")
            print(contents)
        }else {
            print("writing to file ")
            try? "This is the saved file".write(to: saveURL, atomically: true, encoding: String.Encoding.utf8)
        }
    }

}
