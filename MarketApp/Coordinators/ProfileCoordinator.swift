//
//  ProfileCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import SwiftUI
import XCoordinator

enum ProfileRoute: Route {
    case profile
    case changePicture
    case logOut
}

class ProfileCoordinator: NavigationCoordinator<ProfileRoute> {
    init() {
        super.init(initialRoute: .profile)
    }
    
    override func prepareTransition(for route: ProfileRoute) -> NavigationTransition {
        switch route {
        case .profile:
            return .push(buildProfileScreen())
        case .changePicture:
            return .none()
        case .logOut:
            let entranceCoordinator = EntranceCoordinator()
            addChild(entranceCoordinator)
            entranceCoordinator.setRoot(for: rootViewController.view.window!)
            return .none()
        }
    }
    private func buildProfileScreen() -> UIViewController {
        let viewModel = ProfileViewModel(router: unownedRouter)
        let view = ProfileScreenView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
