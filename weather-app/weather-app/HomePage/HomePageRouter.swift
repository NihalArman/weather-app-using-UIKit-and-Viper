//
//  HomePageRouter.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation
import UIKit

typealias LandingPage = HomePageViewControllerProtocol & UIViewController

protocol HomePageRouterProtocol {
    var landingPage: LandingPage? { get set }
    func goToDetailPage(from view: HomePageViewControllerProtocol)
    static func startHomePage() -> HomePageRouterProtocol
}

class HomePageRouter: HomePageRouterProtocol {
    var landingPage: LandingPage?

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
        
        router.landingPage = viewController as? LandingPage
        
        return router
    }

    func goToDetailPage(from view: HomePageViewControllerProtocol) {
        let detailPageRouter = DetailPageRouter.startDetailPage()
        let detailPageViewController = detailPageRouter.detailPage

        if let homePageView = view as? UIViewController {
            homePageView.navigationController?.pushViewController(detailPageViewController!, animated: true)
        }
    }
}
