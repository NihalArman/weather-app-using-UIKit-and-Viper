//
//  HomePagePresenter.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

protocol HomePagePresenterProtocol {
    //Reference to the Router
    var router: HomePageRouterProtocol? { get set }
    //Reference to the Interator
    var interactor: HomePageInteractorProtocol? { get set }
    //reference to the View Controller
    var viewController: HomePageViewControllerProtocol? { get set }
    
    func didFetchWeatherData(with result: Result<WeatherData, Error>)
    func tappedForDetails()
}

class HomePagePresenter: HomePagePresenterProtocol {
    var router: HomePageRouterProtocol?
    var interactor: HomePageInteractorProtocol? {
        didSet {
            interactor?.getWeatherData()
        }
    }
    var viewController: HomePageViewControllerProtocol?
    
    func didFetchWeatherData(with result: Result<WeatherData, Error>) {
        switch result {
        case .success(let data):
            viewController?.updateWeatherData(with: data)
        case .failure:
            viewController?.updateWeatherData(with: "something went wrong")
        }
    }

    func tappedForDetails() {
        router?.goToDetailPage(from: viewController!)
    }
}
