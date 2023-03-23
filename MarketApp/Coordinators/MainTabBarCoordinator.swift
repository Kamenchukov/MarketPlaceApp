//
//  MainTabBarCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import XCoordinator
import SwiftUI

enum TabBarRoute: Route {
    case home
    case favorites
    case basket
    case chat
    case profile
}

class MainTabBarCoordinator: TabBarCoordinator<TabBarRoute> {
    
    private let homeRouter: StrongRouter<HomeRoute>
    private let favoritesRouter: StrongRouter<FavoritesRoute>
    private let basketRouter: StrongRouter<BasketRoute>
    private let chatRouter: StrongRouter<ChatRoute>
    private let profileRouter: StrongRouter<ProfileRoute>
    
    convenience init() {
        UITabBar.appearance().backgroundColor = .lightGray
            

        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().layer.cornerRadius = 50
        UITabBar.appearance().layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        UITabBar.appearance().tintColor = UIColor(CustomColors.buttonsColor)
        UITabBar.appearance().unselectedItemTintColor = .gray
        
  
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        
        let favoritesCoordinator = FavoritesCoordinator()
        favoritesCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        
        let basketCoordinator = BasketCoordinator()
        basketCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "handbag"), tag: 2)
        
        let chatCoordinator = ChatCoordinator()
        chatCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bubble.left"), tag: 3)
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), tag: 4)
        
        self.init(
            homeRouter: homeCoordinator.strongRouter,
            favoritesRouter: favoritesCoordinator.strongRouter,
            basketRouter: basketCoordinator.strongRouter,
            chatRouter: chatCoordinator.strongRouter,
            profileRouter: profileCoordinator.strongRouter
        )
    }
    
    init(
        homeRouter: StrongRouter<HomeRoute>,
        favoritesRouter: StrongRouter<FavoritesRoute>,
        basketRouter: StrongRouter<BasketRoute>,
        chatRouter: StrongRouter<ChatRoute>,
        profileRouter: StrongRouter<ProfileRoute>
    ) {
        
        self.homeRouter = homeRouter
        self.favoritesRouter = favoritesRouter
        self.basketRouter = basketRouter
        self.chatRouter = chatRouter
        self.profileRouter = profileRouter
        super.init(tabs: [homeRouter, favoritesRouter, basketRouter, chatRouter, profileRouter], select: homeRouter)
    }
    override func prepareTransition(for route: TabBarRoute) -> TabBarTransition {
        switch route {
            
        case .home:
            self.addChild(homeRouter.viewController)
            return .select(homeRouter)
        case .favorites:
            return.none()
        case .basket:
            return.none()
        case .chat:
            return.none()
        case .profile:
            return.none()
        }
    }

}
