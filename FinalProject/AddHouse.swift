//
//  AddHouse.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-09.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class AddHouse: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var addDescription: UITextField!
    @IBOutlet weak var addAddress: UITextField!
    @IBOutlet weak var addLandlord: UITextField!
    @IBOutlet weak var addImage: UIImageView!
    
    
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
//        
//        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
//        var context:NSManagedObjectContext = appDel.managedObjectContext
        
        
        //        if let isEmpty = address?.isEmpty where isEmpty == false {
        // Create Entity House
        let entity = NSEntityDescription.entityForName("House", inManagedObjectContext: context)
        // Initialize Record
        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        
        
        // Create Entity Images
        let entityImagesHouse = NSEntityDescription.entityForName("ImagesHouse", inManagedObjectContext: context)
        // Initialize Record
        let recordImagesHouse = NSManagedObject(entity: entityImagesHouse!, insertIntoManagedObjectContext: context)
        
        
        
        let imageData: NSData = UIImagePNGRepresentation(addImage.image!)!
        
        
        recordImagesHouse.setValue(imageData, forKey: "image")

        
        
        
        
        // Create Entity
//        let entity = NSEntityDescription.entityForName("House", inManagedObjectContext: context)
        // Initialize Record
//        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        // Populate Record
        record.setValue(address, forKey: "address")
        record.setValue(descriptionHouse, forKey: "descriptionHouse")
        
        var imagesSet = Set<NSManagedObject>()
        imagesSet.insert(recordImagesHouse)
        
        
        record.setValue(imagesSet, forKey: "images")
        
        
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
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        addImage.image = selectedImage
        
        //record.imagesHouse = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
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
    
    
    @IBAction func selectImageFromLibrary(sender: UITapGestureRecognizer) {
        
        
        
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Action Sheet", message: "Add photo", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        
        self.addAddress.resignFirstResponder()
        self.addDescription.resignFirstResponder()
        self.addLandlord.resignFirstResponder()
        
     

        
        
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        
        
        
        
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
            //Code for launching the camera goes here
            
            
            let imagePickerController = UIImagePickerController()
            
            
            imagePickerController.sourceType = .Camera
            
            imagePickerController.delegate = self
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
            
        }
        actionSheetController.addAction(takePictureAction)
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
            //Code for picking from camera roll goes here
            
            let imagePickerController = UIImagePickerController()
            
            
            imagePickerController.sourceType = .PhotoLibrary
            
            imagePickerController.delegate = self
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)

        
        
}
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
}

