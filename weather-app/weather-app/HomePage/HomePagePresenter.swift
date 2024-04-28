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
    
    func didFetchWeatherData(with result: Result<[WeatherData], Error>)
}

class HomePagePresenter: HomePagePresenterProtocol {
    var router: HomePageRouterProtocol?
    var interactor: HomePageInteractorProtocol?
    var viewController: HomePageViewControllerProtocol?
    
    func didFetchWeatherData(with result: Result<[WeatherData], Error>) {
        
    }
}
