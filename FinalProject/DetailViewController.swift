



//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData
import Material



class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var houseAddress: UITextField!
    @IBOutlet weak var houseDescription: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageDetailedHouse: UIImageView!
    
    @IBOutlet weak var adressLabel: UILabel!
    
    
    var managedObjectContext: NSManagedObjectContext!
    
    
    
    var detailItem: House? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    let pagedScrollViewController = PagedScrollViewController()
    let tableviewController = MenuViewController()
    
    
    
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
            if let label = self.adressLabel{
                label.text = detail.address
            }
            
            if let imageHouse = self.imageDetailedHouse {
                
                if let imageSet = detail.images as? Set<ImagesHouse> {
                    print ("image set size: " + String(imageSet.count))
                    
                    if let mainImageForHouse = imageSet.first {
                        let image1: UIImage = UIImage(data: mainImageForHouse.image!)!
                        imageHouse.image = image1

                    }
                }
            }
        }
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        houseDescription.text = detailItem!.descriptionHouse
        houseAddress.text = detailItem!.address
        
        
        // array to hold images
        var imageViewArray = [UIImageView]()
        
        
        
        if let imageSet1 = detailItem!.images as? Set<ImagesHouse> {
            for imageHouse in imageSet1 {
                if let image = imageHouse.image {
                    if let actualImage = UIImage(data: image) {
                        let imageView = UIImageView(image: actualImage)
                        imageViewArray.append(imageView)
                    }
                }
            }
        
            pagedScrollViewController.pages = imageViewArray
            
            displayContentController(pagedScrollViewController, frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 275))
            
            displayContentController(tableviewController, frame: CGRect(x: 0, y: pagedScrollViewController.view.bounds.maxY + 260, width: view.bounds.size.width, height: view.frame.height - 535))
           
           

        }
        
    }
    
    
 

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        houseDescription.resignFirstResponder()
        houseAddress.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
    
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
    
    
    @IBAction func addRoom(sender: AnyObject) {
        
        
        let alertController = UIAlertController(title: "Add Room", message: "What room are you inspecting?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler { ( textField : UITextField!) -> Void in
            textField.placeholder = "Enter Room Name"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
            let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
            let context:NSManagedObjectContext = appDel.managedObjectContext
            
            let roomEntity = NSEntityDescription.entityForName("Room", inManagedObjectContext: context)
            
            let room1 = NSManagedObject(entity: roomEntity!, insertIntoManagedObjectContext: context) as! Room
            
            
            
            let textfield : UITextField!
            textfield = alertController.textFields?.first
            room1.setValue(textfield.text, forKey: "name")
            self.detailItem?.addRoomsObject(room1)
       
            do {try self.detailItem?.managedObjectContext?.save()
            }catch {
                print(error)
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
     
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
