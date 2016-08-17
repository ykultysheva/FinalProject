//
//  AddRoomDetails.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-16.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class AddRoomDetails: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {

    
    @IBOutlet weak var roomDetailsImageView: UIImageView!
    @IBOutlet weak var roomDetailsLabel: UITextView!
    @IBOutlet weak var roomDetailDescription: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var addedImages: [UIImage] = []
    var managedObjectContext: NSManagedObjectContext!
    var savedRecord: NSManagedObject?
    
    var detailItem: Room? {
        didSet {
            // Update the vieww
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()

    }
    
    func configureView(){
        titleLabel.text = detailItem?.name
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        roomDetailDescription.delegate = self
        roomDetailsLabel.delegate = self
    }
    
    

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    roomDetailsImageView.image = selectedImage
    addedImages.append(selectedImage)
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        
        print("Image tapped")
        
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Action Sheet", message: "Add photo", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        
        self.roomDetailsLabel.resignFirstResponder()
        self.roomDetailDescription.resignFirstResponder()
        
        
        
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
    
    
    
    @IBAction func saveRoomDetail(sender: AnyObject) {
        
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
//        names are reversed bellow, but it's ok for now
        let partDescription = roomDetailsLabel.text!
        let label = roomDetailDescription.text!
        
        guard label.isEmpty == false else {
            showAlertWithTitle("Warning", message: "Add label.", cancelButtonTitle: "OK")
            
            return
        }
        guard partDescription.isEmpty == false else {
            showAlertWithTitle("Warning", message: "Add description.", cancelButtonTitle: "OK")
            
            return
        }
        
        // Create Entity RoomDetails
        let entity = NSEntityDescription.entityForName("RoomDetails", inManagedObjectContext: context)
        // Initialize Record
        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context) as! RoomDetails
        record.setValue(label, forKey: "label")
        record.setValue(partDescription, forKey: "partDescription")
        self.savedRecord = record
        
        if addedImages.isEmpty == false {
            
            let images = record.mutableOrderedSetValueForKey("images")
            
            
            for image in addedImages {
                let imageData: NSData = UIImagePNGRepresentation(image)!
                
                let entityImagesRoomDetails = NSEntityDescription.entityForName("ImagesRoomDetails", inManagedObjectContext: context)
                let recordImagesRoomDetails = NSManagedObject(entity: entityImagesRoomDetails!, insertIntoManagedObjectContext: context)
                
                recordImagesRoomDetails.setValue(imageData, forKey: "image")
                images.addObject(recordImagesRoomDetails)
                
            }
        }
        do {
            try record.managedObjectContext?.save()
            dismissViewControllerAnimated(true, completion: nil)
            
        } catch {
            let saveError = error as NSError
            print("\(saveError), \(saveError.userInfo)")
    }

    }
    
    
    
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

    
    
    @IBAction func toDetailRoomDetails(sender: AnyObject) {
        
        
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailRoomDetails" {
            
            let object = self.savedRecord!
            let controller = segue.destinationViewController as! DetailRoomDetailsViewController
            controller.managedObjectContext = managedObjectContext
            controller.record = object as! RoomDetails
            
            
            
            
            
        }
    }
    
}
