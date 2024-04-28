//
//  HomePageInteractor.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

protocol HomePageInteractorProtocol {
    var presenter: HomePagePresenterProtocol? { get set }
    
    func getWeatherData()
}

class HomePageInteractor {
    var presenter: HomePagePresenterProtocol?
    
    func getWeatherData() {
        
    }
}
