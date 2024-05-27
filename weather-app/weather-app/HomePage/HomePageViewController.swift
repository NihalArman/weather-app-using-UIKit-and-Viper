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
    var weatherData: [WeatherData] { get set }
    func updateWeatherData(with weatherData: WeatherData)
    func updateWeatherData(with error: String)
}

class HomePageViewController: UIViewController, HomePageViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: HomePagePresenterProtocol?
    var weatherData: [WeatherData] = [WeatherData]()

    let stackView: UIStackView = UIStackView()
    let tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        self.navigationItem.title = "Finland Weather Data"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        activateTableViewConstraints()
    }
    
    func updateWeatherData(with weatherData: WeatherData) {
        DispatchQueue.main.async {
            self.weatherData.append(weatherData)
            self.tableView.reloadData()
        }
    }
    
    func updateWeatherData(with error: String) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowsAvailable = getListRowData().count
        return rowsAvailable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()

        let rowToPresent: [String] = getListRowData()

        cell.imageView?.image = UIImage(systemName: "globe.europe.africa.fill")
        cell.textLabel?.text = rowToPresent[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tappedForDetails(weatherData: weatherData[indexPath.row])
    }

    private func getListRowData() -> [String] {
        var cities: [String] = []
        for eachCityData in weatherData {
            let cityName: String = eachCityData.name ?? "City name not found"
//            Temperature data from API reponse comes as Kelvin. Converted into Celsius here
            let temparatureInCelsius: Double = (eachCityData.main?.temp ?? 0.0) - 273.15
            let temparature: String = String(format: "%.1f", temparatureInCelsius)

            let cityInfo: String = cityName + " : " + temparature + "°C"

            cities.append(cityInfo)
        }
        return cities
    }

    private func activateTableViewConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
