//
//  DefaultTableViewHeaderView.swift
//  Claremont
//
//  Created by Adam Dahan on 2015-06-25.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

public class DefaultTableViewHeader: UIView {
    
    public lazy var defaultLabel: UILabel = UILabel()
    public lazy var defaultButton: UIButton = UIButton(type: .ContactAdd)
    /*
    @name   required initWithCoder
    */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /*
    @name   init
    */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareDefaultLabel()
      
    }
    
    /*
    @name   layoutSubviews
    */
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutDefaultLabel()
    }
    
    /*
    @name   prepareDefaultLabel
    */
    public func prepareDefaultLabel() {
        defaultLabel.font = UIFont.systemFontOfSize(12.0)
        defaultLabel.text = "Default Text"
        defaultLabel.textColor = UIColor.blackColor()
        defaultLabel.textAlignment = .Center
        addSubview(defaultLabel)
    }
    
    /*
    @name   layoutDefaultLabel
    */
    public func layoutDefaultLabel() {
        
    }
    
    public func prepareDefaultButton() {
        defaultButton.frame = CGRect(x: self.frame.width - 30, y: 10, width: 20, height: 20)
        defaultButton.tintColor = UIColor.blueColor()
        addSubview(defaultButton)
    }
}
