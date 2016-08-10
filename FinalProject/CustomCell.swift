//
//  CustomCell.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-09.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Landlord: UILabel!
    @IBOutlet weak var Address: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
