//
//  DetailPageRouter.swift
//  weather-app
//
//  Created by Arman Nihal on 25.5.2024.
//

import Foundation
import UIKit

typealias DetailPage = DetailPageViewControllerProtocol & UIViewController

protocol DetailPageRouterProtocol {
    var detailPage: DetailPage? { get set }

    static func startDetailPage() -> DetailPageRouterProtocol
}

class DetailPageRouter: DetailPageRouterProtocol {
    var detailPage: DetailPage?

    static func startDetailPage() -> any DetailPageRouterProtocol {
        let router = DetailPageRouter()
        
        //Initialize presenter, interactor and view controller
        var viewController: DetailPageViewControllerProtocol = DetailPageViewController()
        var presenter: DetailPagePresenterProtocol = DetailPagePresenter()
        var interactor: DetailPageInteractorProtocol = DetailPageInteractor()
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.viewController = viewController
        
        router.detailPage = viewController as? DetailPage

        return router
    }
}
