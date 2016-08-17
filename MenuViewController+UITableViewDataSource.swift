//
//  MenuViewController+UITableViewDataSource.swift
//  Claremont
//
//  Created by Adam Dahan on 2015-06-25.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension MenuViewController: UITableViewDataSource {
    /*
     @name   numberOfSectionsInTableView
     */
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    /*
     @name   numberOfRowsInSection
     */
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let room = self.fetchedResultsController.fetchedObjects![section] as! Room
        print(self.fetchedResultsController.fetchedObjects)
        
        return room.roomDetails?.count ?? 0
    }
    
    /*
     @name   cellForRowAtIndexPath
     */
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: DefaultTableViewCell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! DefaultTableViewCell
        let object = self.fetchedResultsController.fetchedObjects![indexPath.section] as! Room
        let detailObject = object.roomDetails![indexPath.row] as! RoomDetails
        
        cell.defaultLabel.text = detailObject.label
        return cell
    }
    
    /*
     @name   heightForHeaderInSection
     */
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    /*
     @name   titleForHeaderInSection
     */
    //    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //          let room = self.fetchedResultsController.fetchedObjects![section] as! Room
    //        return room.name
    //    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 15, width: 100, height: 20))
        let room = self.fetchedResultsController.fetchedObjects![section] as! Room
        titleLabel.text = room.name
        let button = UIButton(type: .ContactAdd)
        button.frame = CGRect(x: view.frame.width - 50, y: 15, width: 20, height: 20)
        button.tintColor = UIColor.blueColor()
        button.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        button.tag = section
        let vw = UIView()
        vw.backgroundColor = UIColor.grayColor()
        vw.addSubview(button)
        vw.addSubview(titleLabel)
        return vw
    }
    
    func buttonPressed(sender:UIButton!){
        print(sender.tag)
        let room = self.fetchedResultsController.fetchedObjects![sender.tag] as! Room
        print(room.name)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("AddRoomDetails") as! AddRoomDetails
       vc.detailItem = room
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
