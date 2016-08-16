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
        
        return room.roomDetails?.count ?? 0 }
    
    /*
    @name   cellForRowAtIndexPath
    */
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: DefaultTableViewCell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! DefaultTableViewCell
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Room
        let detailObject = object.roomDetails![indexPath.row] as! RoomDetails

        cell.defaultLabel.text = detailObject.label
        return cell
    }
    
    /*
    @name   heightForHeaderInSection
    */
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    /*
    @name   titleForHeaderInSection
    */
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          let room = self.fetchedResultsController.fetchedObjects![section] as! Room
        return room.name
    }
}
