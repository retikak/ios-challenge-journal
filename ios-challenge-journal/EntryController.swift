//
//  EntryController.swift
//  ios-challenge-journal
//
//  Created by Retika Kumar on 4/8/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation



class EntryController {
    
    //array of entries
    
    var entries: [Entry] = []
    
    static let sharedController = EntryController()
    
    private let kEntry = "entry"
    
    
    //add Entry
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        //savetoPersistentstorage
        
        saveToPersistentStorage()
        
    }
    
    
    
    
    
    // updateWith Entry
    
    func updateWithEntry(entry: Entry, newTitle: String, newBodytext: String) {
        entry.title = newTitle
        entry.bodytext = newBodytext
        saveToPersistentStorage()
        
        
    }

    
    
    // save to persistent storage (object to dictionary)
    
    func saveToPersistentStorage() {
        
        
        var entryDictionaryArray: [[String: AnyObject]] = []
        for entry in entries {
            entryDictionaryArray.append(entry.dictionaryCopy)
            // dictionary copy from  entry
        }
        
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaryArray, forKey:kEntry )
        
    }
    
    
    
    
    // load from Persistent storage (dictionary to object)
    
    
    func loadFromPersistentStorage() {
        var entryArray: [Entry] = []
        
        if let entryDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntry) as? [[String: AnyObject]] {
            
            for entryDictionary in entryDictionaryArray {
                
                if let entry = Entry(dictionary: entryDictionary){
                
                    entryArray.append(entry)
                }
                
            }
            self.entries = entryArray
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
