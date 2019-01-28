//
//  InterfaceController.swift
//  Project1 WatchKit Extension
//
//  Created by Pedro Antonio Vazquez Rodriguez on 1/26/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    var notes = [String]()
    var savePath = InterfaceController.getDocumentsDirectory().appendingPathComponent("notes")
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        //table.setNumberOfRows(10, withRowType: "Row")
        do{
            let data = try Data(contentsOf: savePath)
            notes = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String] ?? [String]()
        }catch{
            
        }
        table.setNumberOfRows(notes.count, withRowType: "Row")
        for rowIndex in 0 ..< notes.count{
            set(row: rowIndex, to:notes[rowIndex])
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
    @IBAction func addNewNote() {
        // 1: Request user Info
        presentTextInputController(withSuggestions: nil, allowedInputMode: .plain, completion: {[unowned self] result in
        //2: convert the returned item to a string if posible, otherwise ball out
            guard let result = result?.first as? String else {return}
        
        //3: insert a new row at the end  of our table
        self.table.insertRows(at: IndexSet(integer: self.notes.count), withRowType: "Row")
        //4:give our new row the correct text
        self.set(row: self.notes.count, to: result)
        //5: appens the new note to our array
        self.notes.append(result)
            do{
                let data = try NSKeyedArchiver.archivedData(withRootObject: self.notes, requiringSecureCoding: false)
                try data.write(to: self.savePath)
                
            }catch{
                print("Failed to save data: \(error.localizedDescription).")
            }
        })
    }
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return ["index":String(rowIndex+1),"note":notes[rowIndex],"size":String(notes.count)]
        //return ["index": String(rowIndex + 1),"note": notes[rowIndex]]
    }
    
    
    func set(row rowIndex:Int,to text:String){
        guard let row = table.rowController(at: rowIndex) as? NoteSelectRow else {return}
        //row.textLabel.setText("Note \(rowIndex)")
        row.textLabel.setText("Note \(rowIndex): \(text)")
    
    }
    static func getDocumentsDirectory()->URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
