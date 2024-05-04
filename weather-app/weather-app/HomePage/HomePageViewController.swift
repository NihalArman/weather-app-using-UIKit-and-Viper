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
    var weatherData: WeatherData { get set }
    func updateWeatherData(with weatherData: WeatherData)
    func updateWeatherData(with error: String)
}

class HomePageViewController: UIViewController, HomePageViewControllerProtocol {
    var presenter: HomePagePresenterProtocol?
    var weatherData: WeatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.text = "something"
        label.textAlignment = .center
        view.addSubview(label)
        
        print(weatherData.name)
    }
    
    func updateWeatherData(with weatherData: WeatherData) {
        self.weatherData = weatherData
        print(weatherData.name!)
    }
    
    func updateWeatherData(with error: String) {
    }
}
