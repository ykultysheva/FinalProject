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
        // Check for empty fields
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Landlord", inManagedObjectContext: context) as NSManagedObject
        
        
        // Check if landlord with E-mail already exists
        let fetchRequest = NSFetchRequest()
        let entity = NSEntityDescription.entityForName("Landlord", inManagedObjectContext: context)
        fetchRequest.entity = entity
        //        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "email = %@", email!)
        let results:NSArray = try! context.executeFetchRequest(fetchRequest)
        
        if results.count > 0 {
            displayMyAlertMessage("Account with E-mail Already Exists")
            return
        }
        
        if (name!.isEmpty || password!.isEmpty || confirm!.isEmpty || (email?.isEmpty)!){
            displayMyAlertMessage("You haven't completed all fields")
            return;
        }
        //check for password match
        if password != confirm {
            displayMyAlertMessage("Passwords do not match")
            return
        }
        
        
        newUser.setValue(name, forKey: "name")
        
        newUser.setValue(password, forKey: "password")
        newUser.setValue(email, forKey: "email")
       // Save store data
        do { try
            context.save()
        } catch {
            print("failed to save")
        }
        let myAlert = UIAlertController(title: "Success!", message: "Saved User Successful", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default){
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        myAlert.addAction(okAction)
        presentViewController(myAlert, animated:true, completion: nil)
//        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // alert message function
   


}
