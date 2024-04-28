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
        
        //Initialize presenter, interactor and view controller
        var viewController: HomePageViewControllerProtocol = HomePageViewController()
        var presenter: HomePagePresenterProtocol = HomePagePresenter()
        var interactor: HomePageInteractorProtocol = HomePageInteractor()
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.viewController = viewController
        
        return router
    }
}
