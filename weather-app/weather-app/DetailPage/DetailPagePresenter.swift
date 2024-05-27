//
//  DetailPagePresenter.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

protocol DetailPagePresenterProtocol {
    var router: DetailPageRouterProtocol? { get set }
    var interactor: DetailPageInteractorProtocol? { get set }
    var viewController: DetailPageViewControllerProtocol? { get set }

    func getDetailInformation() -> WeatherData
}

class DetailPagePresenter: DetailPagePresenterProtocol {
    var router: DetailPageRouterProtocol?
    var interactor: DetailPageInteractorProtocol?
    var viewController: DetailPageViewControllerProtocol?

    func getDetailInformation() -> WeatherData {
        return router?.weatherDetailData ?? WeatherData()
    }
}
