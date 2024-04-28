//
//  HomePagePresenter.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

protocol HomePagePresenterProtocol {
    //Reference to the Router
    var router: HomePageRouter? { get set }
    //Reference to the Interator
    var interactor: HomePageInteractor? { get set }
    //Reference to the Presenter
    var presenter: HomePagePresenter? { get set }
    
    func didFetchWeatherData(with result: Result<[WeatherData], Error>)
}

class HomePagePresenter {
    func didFetchWeatherData(with result: Result<[WeatherData], Error>) {
        
    }
}
