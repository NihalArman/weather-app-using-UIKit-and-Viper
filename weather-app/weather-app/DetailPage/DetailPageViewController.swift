//
//  DetailPageViewController.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation
import UIKit

protocol DetailPageViewControllerProtocol {
    var presenter: DetailPagePresenterProtocol? { get set }
}

class DetailPageViewController: UIViewController, DetailPageViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    var presenter: DetailPagePresenterProtocol?
    var weatherDetailData: WeatherData = WeatherData()

    let tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        weatherDetailData = presenter!.getDetailInformation()
        self.navigationItem.title = self.weatherDetailData.name

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        activateTableViewConstraints()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowsAvailable = getTableData().count
        return rowsAvailable
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()

        cell.imageView?.image = UIImage(named: "helsinki")

        let rowToPresent: [String] = getTableData()
        cell.imageView?.image = UIImage(systemName: "cloud.sun.fill")
        cell.textLabel?.text = rowToPresent[indexPath.row]
        return cell
    }

    private func activateTableViewConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func getTableData() -> [String] {
        let temparatureInCelsius: Double = (weatherDetailData.main?.temp ?? 0.0) - 273.15
        let temparature: String = "Temparature: " + String(format: "%.1f", temparatureInCelsius)

        let feelsLikeInCelsius: Double = (weatherDetailData.main?.feels_like ?? 0.0) - 273.15
        let feelsLike: String = "Feels like: " + String(format: "%.1f", feelsLikeInCelsius)

        let maxTempInCelsius: Double = (weatherDetailData.main?.temp_max ?? 0.0) - 273.15
        let maxTemp: String = "Maximum Temparature: " + String(format: "%.1f", maxTempInCelsius)

        let minTempInCelsius: Double = (weatherDetailData.main?.temp_min ?? 0.0) - 273.15
        let minTemp: String = "Minimum Temparature: " + String(format: "%.1f", minTempInCelsius)

        let humidity: String = "Humidity: " + String(format: "%.1f", weatherDetailData.main?.humidity ?? "Humidity not available")

        let pressure: String = "Pressure: " + String(format: "%.1f", weatherDetailData.main?.pressure ?? "Pressure not available")


        var weatherInformations: [String] = [temparature, feelsLike, maxTemp, minTemp, humidity, pressure]

        return weatherInformations
    }
}
