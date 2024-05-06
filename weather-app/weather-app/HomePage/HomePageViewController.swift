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

class HomePageViewController: UIViewController, HomePageViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: HomePagePresenterProtocol?
    var weatherData: WeatherData = WeatherData()
    
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        tableView.frame = CGRectMake(0, 50, 320, 200)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func updateWeatherData(with weatherData: WeatherData) {
        DispatchQueue.main.async {
            self.weatherData = weatherData
            self.tableView.reloadData()
        }
    }
    
    func updateWeatherData(with error: String) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowsAvailable = getRowData().count
        return rowsAvailable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        
        let rowToPresent: [String] = getRowData()
        
        cell.textLabel?.text = rowToPresent[indexPath.row]
        return cell
    }
    
    func getRowData() -> [String] {
        let cityName: String = weatherData.name ?? "City not found"
        
        // Temperature data from API reponse comes as Kelvin. Converted into Celsius here
        let temparatureInCelsius: Double = (weatherData.main?.temp ?? 0.0) - 273.15
        let temparature: String = String(format: "%.1f", temparatureInCelsius)
        
        let humidity: String = String(format: "%.1f", weatherData.main?.humidity ?? "Humidity not available")
        
        let rowData: [String] = ["City: " + cityName, "Temparature: " + temparature, "Humidity: " + humidity]
        
        return rowData
    }
}
