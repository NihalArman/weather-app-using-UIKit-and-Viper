//
//  HomePageInteractor.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

protocol HomePageInteractorProtocol {
    //reference to the presenter
    var presenter: HomePagePresenterProtocol? { get set }
    var weatherService: WeatherAPIService { get set }
    
    func getWeatherData()
}

class HomePageInteractor: HomePageInteractorProtocol {
    var presenter: HomePagePresenterProtocol?
    var weatherService: WeatherAPIService
    
    init() {
        self.weatherService = WeatherAPIService()
    }
    
    func getWeatherData() {
        self.weatherService.fetchWeatherDataFromAPI() { error, success, data in
            if let error = error {
                self.presenter?.didFetchWeatherData(with: .failure(error))
                return
            }
            
            if success, let weatherData = data {
                self.presenter?.didFetchWeatherData(with: .success(weatherData))
            }
        }
    }
}
