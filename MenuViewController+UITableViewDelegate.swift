//
//  MenuViewController+UITableViewDelegate.swift
//  Claremont
//
//  Created by Adam Dahan on 2015-11-02.
//  Copyright © 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension MenuViewController: UITableViewDelegate {
    
    /*
     @name   required didSelectRowAtIndexPath
     */
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // didSelect
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        print(indexPath)
        let vc = storyboard.instantiateViewControllerWithIdentifier("DetailRoomDetails") as! DetailRoomDetailsViewController
        let objects = self.fetchedResultsController.fetchedObjects
        let room = objects![indexPath.section] as! Room
        let detailObject = room.roomDetails![indexPath.row] as! RoomDetails
        vc.record = detailObject
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
