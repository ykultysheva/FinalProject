//
//  DetailRoomDetailsViewController.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-16.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class DetailRoomDetailsViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var roomDetailsLabel: UILabel!
    @IBOutlet weak var roomDetailDescription: UILabel!
    @IBOutlet weak var belongsToRoom: UILabel!
    
    
    var managedObjectContext: NSManagedObjectContext!
    var record: RoomDetails?
    
    
    
    let pagedScrollViewController = PagedScrollViewController()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let roomDetails = record {
            roomDetailsLabel.text = roomDetails.label
            roomDetailDescription.text = roomDetails.partDescription
            belongsToRoom.text = "In the " + (roomDetails.room?.name)!}
        
        
        var imageViewArray = [UIImageView]()
        
        if let imageSet1 = record!.images as? Set<ImagesRoomDetails> {
            for imageRoomDetails in imageSet1 {
                if let image = imageRoomDetails.image {
                    if let actualImage = UIImage(data: image) {
                        let imageView = UIImageView(image: actualImage)
                        imageViewArray.append(imageView)
                    }
                }
            }
            
            pagedScrollViewController.pages = imageViewArray
            
            displayContentController(pagedScrollViewController, frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 400))
       
    }
}
    
    @IBAction func backToHouse(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)    
//self.performSegueWithIdentifier("someIdentifier", sender: self)
    }
    

}
