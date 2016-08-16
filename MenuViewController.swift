//
//  MenuViewController.swift
//  Claremont
//
//  Created by Adam Dahan on 2015-06-25.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

public class MenuViewController: UIViewController {
    
    public lazy var tableView: UITableView = UITableView()
    public var tableViewHeaderView: DefaultTableViewHeader?
    
    /*
    @name   viewDidLoad
    */
    public override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareTableView()
        prepareTableViewHeader()
    }
    
    /*
    @name   viewDidLayoutSubviews
    */
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutTableView()
        layoutTableViewHeader()
    }
    
}

    