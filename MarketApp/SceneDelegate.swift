//
//  SceneDelegate.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let entranceCoordinator = EntranceCoordinator().strongRouter
    @StateObject var viewModel = CoreDataViewModel()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { fatalError("No one window scene exist") }
        window = UIWindow(windowScene: windowScene)
        entranceCoordinator.setRoot(for: window!)
    }
}

