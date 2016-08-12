//
//  LoginViewController.swift
//  FinalProject
//
//  Created by JOSE PILAPIL on 2016-08-10.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, NSFetchedResultsControllerDelegate  {
    
    // MARK: Properties
        
    var managedObjectContext: NSManagedObjectContext? = nil

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    // MARK: Actions
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        let email = emailField.text
        let password = passwordField.text
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext
        let fetchRequest = NSFetchRequest()
        // Edit the entity name as appropriate.
        
        let entity = NSEntityDescription.entityForName("Landlord", inManagedObjectContext: context)
        fetchRequest.entity = entity
//        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "email = %@", email!)
        let results:NSArray = try! context.executeFetchRequest(fetchRequest)
        
        if results.count == 0 {
            displayMyAlertMessage("Invalid email or password")
            return
        }
        
        if (email!.isEmpty || password!.isEmpty){
            displayMyAlertMessage("You haven't completed all fields")
            return
        }
        
        if password != results[0].password{
            displayMyAlertMessage("Invalid Password")
        }else {
            performSegueWithIdentifier("toHouse", sender: self)
            return
        }
    }
    func displayMyAlertMessage(userMessage:String) {
        
        let alert = UIAlertController(title: "Alert!", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}
