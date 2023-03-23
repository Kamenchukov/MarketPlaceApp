//
//  ChatCoordinator.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import XCoordinator

enum ChatRoute: Route {
    case chat
}

class ChatCoordinator: NavigationCoordinator<ChatRoute> {
    init() {
        super.init(initialRoute: .chat)
    }
    override func prepareTransition(for route: ChatRoute) -> NavigationTransition {
        switch route {
        case .chat:
            return .none()
        }
    }
}
