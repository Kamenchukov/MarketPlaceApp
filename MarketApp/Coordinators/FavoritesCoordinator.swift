//
//  FavoritesCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import XCoordinator

enum FavoritesRoute: Route {
    case favorites
}

class FavoritesCoordinator: NavigationCoordinator<FavoritesRoute> {
    
    init() {
        super.init(initialRoute: .favorites)
    }
    override func prepareTransition(for route: FavoritesRoute) -> NavigationTransition {
        switch route {
        case .favorites:
            return .none()
        }
    }
}
