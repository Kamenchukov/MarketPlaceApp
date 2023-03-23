//
//  SignInViewModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 19.03.2023.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var password: String
    @Published var user: UserModel?
    
    private var coreDataManager = AppDelegate.shared
    
    init(user: UserModel? = nil, firstName: String, lastName: String, email:String, password: String = "") {
        self.password = user?.password ?? "Someting goes wrong"
        self.email = user?.email ?? "Someting goes wrong"
        self.lastName = user?.lastName ?? "Someting goes wrong"
        self.firstName = user?.firstName ?? "Someting goes wrong"
        self.user = user
        
        if user == nil {
            self.firstName = ""
            self.lastName = ""
            self.email = ""
            self.password = ""
        } else {
            self.firstName = (user?.firstName)!
            self.lastName = (user?.lastName)!
            self.email = (user?.email)!
            self.password = (user?.password)!
        }
    }
    
    func addUser(viewModel: CoreDataViewModel) {
        let newUser = UserModel(context: coreDataManager.viewContext)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.password = ""
        coreDataManager.saveContext()
        viewModel.users = coreDataManager.fetchData()
        print(newUser)
    }
}
