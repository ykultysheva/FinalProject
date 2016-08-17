//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        print(NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask))
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.removeObjectForKey("email")
//        defaults.removeObjectForKey("password")
//        
        
//        NAVIGATION:
        
//        let masterNavigationController = window!.rootViewController as! UINavigationController
//        let controller = masterNavigationController.topViewController as! MasterViewController
//        controller.managedObjectContext = self.managedObjectContext
        
        
//        //create Managed Object
//        let entityPerson = NSEntityDescription.entityForName("Landlord", inManagedObjectContext: self.managedObjectContext)
//        
//        let landlord1 = NSManagedObject(entity: entityPerson!, insertIntoManagedObjectContext: self.managedObjectContext)
//        
//        let landlord2 = NSManagedObject(entity: entityPerson!, insertIntoManagedObjectContext: self.managedObjectContext)
//        
//        landlord1.setValue("Yana", forKey: "name")
//        landlord2.setValue("Bob", forKey: "name")
//        
//        let entityHouse = NSEntityDescription.entityForName("House", inManagedObjectContext: self.managedObjectContext)
//        let house1 = NSManagedObject(entity: entityHouse!, insertIntoManagedObjectContext: self.managedObjectContext)
//        let house2 = NSManagedObject(entity: entityHouse!, insertIntoManagedObjectContext: self.managedObjectContext)
//        let house4 = NSManagedObject(entity: entityHouse!, insertIntoManagedObjectContext: self.managedObjectContext)
//        
//        // Populate House
//        house1.setValue("232 Combe", forKey: "address")
//        house1.setValue("3BR/2W", forKey: "descriptionHouse")
//        house2.setValue("66 Grenadier", forKey: "address")
//        house2.setValue("bungalow", forKey: "descriptionHouse")
//        house4.setValue("St.Clair", forKey: "address")
//        house4.setValue("Semi", forKey: "descriptionHouse")
//
//
//        
////        save to the backing store
//        do {
//            try landlord1.managedObjectContext?.save()
//            try landlord2.managedObjectContext?.save()
//            try house1.managedObjectContext?.save()
//            try house2.managedObjectContext?.save()
//            try house4.managedObjectContext?.save()
//        } catch {
//            print(error)
//        }
//        
////        Fetch Request
//        // Initialize Fetch Request
//        let fetchRequest = NSFetchRequest()
//        
//        // Configure Fetch Request
//        fetchRequest.entity = entityPerson
//        
//        do {
//            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//            print(result)
//            
//        } catch {
//            let fetchError = error as NSError
//            print(fetchError)
//        }
//        
////        Access attribute of an object
////        do {
////            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
////            
////            if (result.count > 0) {
////                let landlord = result[6] as! NSManagedObject
////                
////                print("1 - \(landlord)")
////                
////                if let name = landlord.valueForKey("name") {
////                    print("\(name)")
////                }
////                
////                print("2 - \(landlord)")
////            }
////            
////        } catch {
////            let fetchError = error as NSError
////            print(fetchError)
////        }
//   
//        
////        Update
//        do {
//            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//            let landlord3 = result[0] as! NSManagedObject
//            landlord3.setValue("Yana 123", forKey: "name")
//            try landlord3.managedObjectContext?.save()
//        } catch {
//            let saveError = error as NSError
//            print(saveError)
//        }
//        
//       
//        do {
//            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//            let landlord4 = result[0] as! NSManagedObject
//            self.managedObjectContext.deleteObject(landlord4)
//            try self.managedObjectContext.save()
//        } catch {
//            let saveError = error as NSError
//            print(saveError)
//        }
//        
////        add house to the landlord (relationships)
//        landlord1.setValue(NSSet(object: house1), forKey: "houses")
//        
//        do {
//            try landlord1.managedObjectContext?.save()
//        } catch {
//            let saveError = error as NSError
//            print(saveError)
//        }
//        
//        landlord2.setValue(NSSet(object: house2), forKey: "houses")
//        
//        do {
//            try landlord2.managedObjectContext?.save()
//        } catch {
//            let saveError = error as NSError
//            print(saveError)
//        }
//        
////        add house to the landlord1
//        let houses = landlord1.mutableSetValueForKey("houses")
//        houses.addObject(house4)
//        do {
//            try landlord1.managedObjectContext?.save()
//        } catch {
//            let saveError = error as NSError
//            print(saveError)
//        }
//        
////        sorting
//        // Create Fetch Request
////        let fetchRequest2 = NSFetchRequest(entityName: "Landlord")
////        
////        // Add Sort Descriptor
////        let sortDescriptor2 = NSSortDescriptor(key: "name", ascending: true)
////        fetchRequest2.sortDescriptors = [sortDescriptor2]
////        
////        // Execute Fetch Request
////        do {
////            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest2)
////            
////            for managedObject in result {
////                if let name = managedObject.valueForKey("name") {
////                    print("\(name)")
////                }
////            }
////        } catch {
////            let fetchError = error as NSError
////            print(fetchError)
////        }
//        
//// predicates
//        
//        // Fetching
//        let fetchRequest3 = NSFetchRequest(entityName: "Landlord")
//        
//        // Create Predicate
//        let predicate = NSPredicate(format: "%K == %@", "name", "Bob")
//        fetchRequest3.predicate = predicate
//        
//        // Execute Fetch Request
//        do {
//            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest3)
//            
//            for managedObject in result {
//                if let name = managedObject.valueForKey("name") {
//                    print("\(name)")
//                }
//            }
//            
//        } catch {
//            let fetchError = error as NSError
//            print(fetchError)
//        }
//        
//        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "lighthouse.FinalProject" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("FinalProject", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

