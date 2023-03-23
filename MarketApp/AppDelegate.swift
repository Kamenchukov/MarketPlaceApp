//
//  AppDelegate.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let shared = AppDelegate()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "User")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func loadPersistentStores() {
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                print("Error, loading data: \(error!.localizedDescription)")
                return
            }
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error while saving: \(error.localizedDescription)")
            }
        }
    }
    
    func sortFetchNotes() -> [NSSortDescriptor] {
            let dataSort = NSSortDescriptor(keyPath: \UserModel.firstName, ascending: false)
            return [dataSort]
        }
        
    func fetchData() -> [UserModel] {
            let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
            request.sortDescriptors = sortFetchNotes()
    
            var notes: [UserModel] = []
            do {
                notes = try viewContext.fetch(request)
            } catch let error {
                print("Error:\(error.localizedDescription)")
            }
            return notes
        }
}

