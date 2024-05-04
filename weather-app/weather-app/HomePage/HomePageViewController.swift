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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "something"
        print("printing from table view: ")
        print(weatherData.name)
        return cell
    }
}
