//
//  Entry.swift
//  ios-challenge-journal
//
//  Created by Retika Kumar on 4/8/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let kTitle = "title"
    private let kTimestamp = "timestamp"
    private let kBodytext = "bodytext"
    
    
    var title:String
    var timestamp:NSDate
    var bodytext: String
    
    
    
    //dictionaryCopy
    
    var dictionaryCopy : [String:AnyObject] {
        return [kTitle:title, kTimestamp:timestamp, kBodytext:bodytext]
        
        
    }
    
    
    init(title:String, timestamp:NSDate = NSDate(), bodytext:String) {
        self.title = title
        self.timestamp = timestamp
        self.bodytext = bodytext
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
        timestamp = dictionary[kTimestamp] as? NSDate,
            bodytext = dictionary[kBodytext] as? String else {return nil}
        self.title = title
        self.timestamp = timestamp
        self.bodytext = bodytext
    }
    
    
}

func ==(lhs:Entry, rhs:Entry) -> Bool {
    if lhs.title == rhs.title && lhs.timestamp == rhs.timestamp && lhs.bodytext == rhs.bodytext {
        return true
    }else {
        return false
    }
    
}
