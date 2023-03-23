//
//  EntranceCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import SwiftUI
import XCoordinator

enum EntranceRoute: Route {
    case signInScreen
    case logInScreen
    case tabBarScreen
}

final class EntranceCoordinator: NavigationCoordinator<EntranceRoute> {
    @StateObject var viewModel = CoreDataViewModel()
    init() {
        super.init(initialRoute: .signInScreen)
    }
    
    override func prepareTransition(for route: EntranceRoute) -> NavigationTransition {
        switch route {
            
        case .signInScreen:
            return .push(buildSignInScreen())
        case .logInScreen:
            return .push( buildLogInScreen())
        case .tabBarScreen:
            let tabCoordinator = MainTabBarCoordinator()
            addChild(tabCoordinator)
            tabCoordinator.setRoot(for: rootViewController.view.window!)
            return .none()
        }
    }
    
    private func buildSignInScreen() -> UIViewController {
        let viewModel = EntranceViewModel(router: unownedRouter)
        let view = SignInScreen(navigationViewModel: viewModel, contentViewModel: CoreDataViewModel(), viewModel: SignInViewModel(firstName: "", lastName: "", email: ""))
        return UIHostingController(rootView: view)
    }
    
    private func buildLogInScreen() -> UIViewController {
        let viewModel = EntranceViewModel(router: unownedRouter)
        let view = LogInScreen(viewModel: viewModel, contentViewModel: CoreDataViewModel())
        return UIHostingController(rootView: view)
    }
}

