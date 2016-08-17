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
        let vc = storyboard.instantiateViewControllerWithIdentifier("DetailRoomDetails") as! DetailRoomDetailsViewController
        let room = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Room
        vc.record = room.roomDetails?[indexPath.row] as? RoomDetails
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
