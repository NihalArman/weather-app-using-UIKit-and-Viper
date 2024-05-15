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

    let stackView: UIStackView = UIStackView()
    let titleView: UILabel = UILabel()
    let tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        activateStackViewConstraints()

        titleView.text = "Weather Data"
        titleView.textAlignment = .center
        stackView.addArrangedSubview(titleView)

        tableView.delegate = self
        tableView.dataSource = self
        stackView.addArrangedSubview(tableView)



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
    
    private func getRowData() -> [String] {
        let cityName: String = weatherData.name ?? "City not found"
        
        // Temperature data from API reponse comes as Kelvin. Converted into Celsius here
        let temparatureInCelsius: Double = (weatherData.main?.temp ?? 0.0) - 273.15
        let temparature: String = String(format: "%.1f", temparatureInCelsius)
        
        let humidity: String = String(format: "%.1f", weatherData.main?.humidity ?? "Humidity not available")
        
        let rowData: [String] = ["City: " + cityName, "Temparature: " + temparature, "Humidity: " + humidity]
        
        return rowData
    }

    private func activateStackViewConstraints() {
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
