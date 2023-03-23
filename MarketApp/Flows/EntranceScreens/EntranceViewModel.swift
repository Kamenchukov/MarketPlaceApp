//
//  EntranceViewModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import Foundation
import XCoordinator

final class EntranceViewModel: ObservableObject {
    
    private let router: UnownedRouter<EntranceRoute>
    
    init(router: UnownedRouter<EntranceRoute>) {
        self.router = router
    }
    
    func showSignIn() {
        router.trigger(.signInScreen)
    }
    
    func showLogIn() {
        router.trigger(.logInScreen)
    }
    
    func showTabBar() {
        router.trigger(.tabBarScreen)
    }
    
    func defaultUser() {
        
    }
}
