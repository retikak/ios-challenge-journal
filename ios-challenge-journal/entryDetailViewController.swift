//
//  entryDetailViewController.swift
//  ios-challenge-journal
//
//  Created by Retika Kumar on 4/8/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class entryDetailViewController: UIViewController {
    
    var entry: Entry?


    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry {
            self.updateViewWithEntry(entry)
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateViewWithEntry(entry: Entry) {
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext

    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        
        // if entry = entry
        if let entry = entry {
            EntryController.sharedController.updateWithEntry(entry, newTitle: titleTextField.text!, newBodytext: bodyTextView.text)
            navigationController?.popViewControllerAnimated(true)
        } else {
            let newEntry = Entry(title: titleTextField.text!, timestamp: NSDate(), bodytext: bodyTextView.text)
            EntryController.sharedController.addEntry(newEntry)
            navigationController?.popViewControllerAnimated(true)
            
            
        }
        
            
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
