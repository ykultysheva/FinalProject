//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by JOSE PILAPIL on 2016-08-10.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    
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
    
    @IBAction func hasAccountButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func registerAccount(sender: AnyObject) {
    let name = nameField.text
    let email = emailField.text
    let password = passwordField.text
    let confirm = confirmPasswordField.text
        // Provide alert if user has not completed all fields
        if (name!.isEmpty || password!.isEmpty || confirm!.isEmpty || (email?.isEmpty)!){
            displayMyAlertMessage("You haven't completed all fields")
            return;
        }
        
        if password != confirm {
            displayMyAlertMessage("Passwords do not match")
        }
        
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext
    
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Landlord", inManagedObjectContext: context) as NSManagedObject
        
        newUser.setValue(name, forKey: "name")
        
        newUser.setValue(password, forKey: "password")
        newUser.setValue(email, forKey: "email")
       
        do { try
            context.save()
        } catch {
            print("failed to save")
        }
        
    }
    
    // alert message function
    func displayMyAlertMessage(userMessage:String) {
        
        let alert = UIAlertController(title: "Alert!", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }


}
