//
//  AppDelegate.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/15/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let data : [Float:Float] = [0:0,1:1,2:1.414,3:2.732,4:2,5:5.236,6:3.469,7:2.693,8:5.828,9:3.201]
        let max = data.values.max()
        print("max is \(max)")
        processFirstName()
        let testS = "12345678"
        //let startIndex = testS.startIndex.advancedBy(2) //testS.[testS.startIndex.advancedBy(2)] is "3"
        let testSub = testS[testS.characters.index(testS.startIndex, offsetBy: 1)...testS.characters.index(testS.startIndex, offsetBy: 3)]
        print(testSub )
        let code = "1008"
        if (isValidCode(code)){
            print("\(code) is valid")
        }
        print("total decodeWay: \(numDecodings(code))")
        
        print(getHint("187", "178"))
        let line: String = "(1,6), (6,7), (2,7), (9,1)"
        isSqure(line)
        var s = sortedCharsInString("welcome")
        print(s)
        print(String(s.characters.reversed()))
        s = s.substring(from: s.characters.index(s.startIndex, offsetBy: 1))
        print(s)
        
        let words = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let myatoi = myAtoi("8879")//myAtoi("2147483647")
        print(myatoi)
        let list = findAnagramsOfWordInDictionary("eat", words: words)
        print(list)
        print(groupAnagrams(words))
//        print(myItoA(-15))
//        let value = 99 // leter "c" is at 99
//        // Convert Int to a UnicodeScalar.
//        let u = UnicodeScalar(value)
//        // Convert UnicodeScalar to a Character.
//        let char = Character(u)
//        
        // Write results.
        //print("char:\(char)**") //c**
        //print("first unique char is \(findFirstUniqueChar("today is the most wonderful day"))") //first unique char is Optional("i")
//        let mat = [[1,2],[3,4]]
//        print (kthSmallest(mat,2))//3
//        
//        var dpc:[[Character]] = Array(count: 5, repeatedValue:Array(count:3, repeatedValue:" "))
//        
//        print ("*\(dpc[4][2])**") //* **
        experiments()
        stringExperiments()
        stringsExperiment()
        print(permuteString("ACC"))
        print(permuteStringViaSet("MNN"))
        let grid = [[1,3,1],[1,5,1],[4,2,1]]
        print(minPathSum(grid))

        if(isOneEditDistance("a", "ab")){
            print("YES");
        }
        print(multiply("99", "9"))
        print("find order is \(findOrder(3, [[2,1], [1,0]]))") //[[5,8],[3,5],[1,9],[4,5],[0,2],[1,9],[7,8],[4,9]]
        print("find order bfs:\(findOrderBFS(10, [[5,8],[3,5],[1,9],[4,5],[0,2],[1,9],[7,8],[4,9]]))")
        let alinwords = ["wrt","wrf","er","ett","rftt"]
        print(alienOrder(alinwords))
        let persons = [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
        print(reconstructQueue(persons))
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "XintongBi.Swift2Garden" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "Swift2Garden", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?

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
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
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

