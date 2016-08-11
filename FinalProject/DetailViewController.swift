//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var Address: UILabel!
    
    
    @IBOutlet weak var houseAddress: UITextField!
    @IBOutlet weak var houseDescription: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var managedObjectContext: NSManagedObjectContext!
    
    
    
    var detailItem: House? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
//    to populate text fields with house details
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.valueForKey("descriptionHouse")!.description
            }
            if let label = self.Address {
                label.text = detail.valueForKey("address")!.description
            }
            if let text1 = self.houseAddress {
                text1.text = detail.valueForKey("address")!.description
            }
            if let text2 = self.houseDescription {
                text2.text = detail.valueForKey("descriptionHouse")!.description
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        houseDescription.text = detailItem!.descriptionHouse
        houseAddress.text = detailItem!.address
        
            }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        houseDescription.resignFirstResponder()
        houseAddress.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func saveChanges(sender: AnyObject) {
        
        let address = houseAddress.text!
        let descriptionHouse = houseDescription.text!
        
        guard address.isEmpty == false else {
            showAlertWithTitle("Warning", message: "Add address.", cancelButtonTitle: "OK")
            
            return
        }
        guard descriptionHouse.isEmpty == false else {
            showAlertWithTitle("Warning", message: "Add description.", cancelButtonTitle: "OK")
            
            return
        }
 
        detailItem!.address = address
        detailItem!.descriptionHouse = descriptionHouse
        
        do {
            // Save Record
            try managedObjectContext?.save()
            
            // Dismiss View Controller
            self.performSegueWithIdentifier("backToMaster", sender: self)
            
        } catch {
            let saveError = error as NSError
            print("\(saveError), \(saveError.userInfo)")
            
        }
        
    }
    
    
    @IBAction func cancelChanges(sender: UIButton) {
        self.performSegueWithIdentifier("backToMaster", sender: self)

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

