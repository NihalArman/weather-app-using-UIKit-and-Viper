//
//  SceneDelegate.swift
//  weather-app
//
//  Created by Arman Nihal on 29.4.2024.
//

import Foundation
import UIKit

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homePageRouter = HomePageRouter.startHomePage()
        let landingPageViewController = homePageRouter.landingPage
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = landingPageViewController
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // ...
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // ...
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // ...
    }
    
    // ...
}
