//
//  ProfileViewModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import Foundation
import XCoordinator

final class ProfileViewModel {
    
    private let router: UnownedRouter<ProfileRoute>
    
    init(router: UnownedRouter<ProfileRoute>) {
        self.router = router
    }
    
    func logOut() {
        router.trigger(.logOut)
    }
}
