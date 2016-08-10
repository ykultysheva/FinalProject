//
//  AddHouse.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-09.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit

class AddHouse: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var addDescription: UITextField!
    
    @IBOutlet weak var addAddress: UITextField!
    
    @IBOutlet weak var addLandlord: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        addAddress.delegate = self
        addDescription.delegate = self
        addLandlord.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func save(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}



