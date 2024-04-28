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
    
    func getWeatherData() {
        
    }
}
