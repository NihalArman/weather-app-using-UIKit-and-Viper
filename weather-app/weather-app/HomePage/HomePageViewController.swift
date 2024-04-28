//
//  HomePageViewController.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation
import UIKit

protocol HomePageViewControllerProtocol {
    //reference to the presenter
    var presenter: HomePagePresenterProtocol? { get set }
    
    func updateWeatherData(with weatherData: [WeatherData])
    func updateWeatherData(with error: String)
}

class HomePageViewController: UIViewController, HomePageViewControllerProtocol {
    var presenter: (any HomePagePresenterProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    func updateWeatherData(with weatherData: [WeatherData]) {
        
    }
    
    func updateWeatherData(with error: String) {
        
    }
    
    
}
