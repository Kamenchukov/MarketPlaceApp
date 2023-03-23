//
//  CoreDataViewModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 19.03.2023.
//

import Foundation
import UIKit

final class CoreDataViewModel: ObservableObject {
    private var coreDataManager = AppDelegate.shared
    @Published var users: [UserModel] = []
    @Published var isNewUser: Bool = false
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func addUser() {
        isNewUser.toggle()
    }
    
    func updateData() {
        users = coreDataManager.fetchData()
    }
    
    func defaultUser() {
        
    }
    func fetchUsers() -> [UserModel] {
        var user: [UserModel] = []
        user = coreDataManager.fetchData()
        return user
    }
}
