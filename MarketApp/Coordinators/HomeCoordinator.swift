//
//  HomeCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import XCoordinator
import SwiftUI

enum HomeRoute: Route {
    case home
    case item
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    init() {
        super.init(initialRoute: .home)
    }
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
            
        case .home:
            return .push(buildHomeScreen())
        case .item:
            return .none()
        }
    }
    private func buildHomeScreen() -> UIViewController {
        let viewModel = MainViewModel(router: unownedRouter)
        let view = MainScreenView(viewModel: viewModel, focused: .constant(false))
        return UIHostingController(rootView: view)
    }
}
