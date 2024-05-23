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
    func getWeatherData()
}

class HomePageInteractor: HomePageInteractorProtocol {
    var presenter: HomePagePresenterProtocol?
    var weatherService: WeatherAPIServiceProtocol
    var cities: [String] = ["Helsinki"]

    init(weatherService: WeatherAPIServiceProtocol = URLSession.shared) {
        self.weatherService = weatherService
    }
    
    func getWeatherData() {
        for city in cities {
            self.weatherService.fetchWeatherDataFromAPI(city: city) { error, success, data in
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
}
