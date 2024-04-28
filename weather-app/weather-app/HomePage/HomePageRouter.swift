//
//  HomePageRouter.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

protocol HomePageRouterProtocol {
    static func startHomePage() -> HomePageRouterProtocol
}

class HomePageRouter: HomePageRouterProtocol {
    static func startHomePage() -> any HomePageRouterProtocol {
        let router = HomePageRouter()
        
        return router
    }
}
