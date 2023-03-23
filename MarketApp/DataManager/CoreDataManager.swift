//
//  CoreDataManager.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 18.03.2023.
//

import CoreData

class CoreDataManager: ObservableObject {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "User")
        loadPersistentStores()
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
}
