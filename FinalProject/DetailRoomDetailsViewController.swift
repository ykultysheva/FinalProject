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
    
    var managedObjectContext: NSManagedObjectContext!
    var record: RoomDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let roomDetails = record {
            roomDetailsLabel.text = roomDetails.label
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
