//
//  AddHouse.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-09.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class AddHouse: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var addDescription: UITextField!
    
    @IBOutlet weak var addAddress: UITextField!
    
    @IBOutlet weak var addLandlord: UITextField!
    
    
    var managedObjectContext: NSManagedObjectContext!
    
    
    
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
        
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext
        
        
        let address = addAddress.text!
        let descriptionHouse = addDescription.text!
        
        guard address.isEmpty == false else {
            showAlertWithTitle("Warning", message: "Add address.", cancelButtonTitle: "OK")
            
            return
        }
        guard descriptionHouse.isEmpty == false else {
            showAlertWithTitle("Warning", message: "Add description.", cancelButtonTitle: "OK")
            
            return
        }
        
        //        if let isEmpty = address?.isEmpty where isEmpty == false {
        // Create Entity
        let entity = NSEntityDescription.entityForName("House", inManagedObjectContext: context)
        // Initialize Record
        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        // Populate Record
        record.setValue(address, forKey: "address")
        record.setValue(descriptionHouse, forKey: "descriptionHouse")
        
        do {
            // Save Record
            try record.managedObjectContext?.save()
            
            // Dismiss View Controller
            dismissViewControllerAnimated(true, completion: nil)
            
        } catch {
            let saveError = error as NSError
            print("\(saveError), \(saveError.userInfo)")
            
            //                // Show Alert View
        }
        
    }
    //    else {
    //            // Show Alert View
    //            showAlertWithTitle("Warning", message: "Your house needs an address.", cancelButtonTitle: "OK")
    //        }
    //
    //    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    private func showAlertWithTitle(title: String, message: String, cancelButtonTitle: String) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Configure Alert Controller
        alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .Default, handler: nil))
        
        // Present Alert Controller
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}

