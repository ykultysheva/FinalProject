//
//  UIViewController.swift
//  Claremont
//
//  Created by Adam Dahan on 2015-11-02.
//  Copyright © 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension UIViewController {
    /*
    @name   displayContentController
    @param  content View controller to be displayed as child
    */
    func displayContentController(content: UIViewController, frame: CGRect?) {
        addChildViewController(content)
        content.view.frame = frame == nil ? view.frame : frame!
        view.addSubview(content.view)
        content.didMoveToParentViewController(self)
    }

    /*
    @name   hideContentController
    @param  content View controller to be removed as child
    */
    func hideContentController(content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let alert = UIAlertController(title: "Alert!", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}
