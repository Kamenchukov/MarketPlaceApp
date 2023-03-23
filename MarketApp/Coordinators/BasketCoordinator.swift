//
//  BasketCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import XCoordinator

enum BasketRoute: Route {
    case basket
}

class BasketCoordinator: NavigationCoordinator<BasketRoute> {
    init() {
        super.init(initialRoute: .basket)
    }
    override func prepareTransition(for route: BasketRoute) -> NavigationTransition {
        switch route {
        case .basket:
            return .none()
        }
    }
}
