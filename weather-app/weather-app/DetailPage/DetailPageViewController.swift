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
        activateTableViewConstraints()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()

        cell.imageView?.image = UIImage(named: "helsinki")
        cell.textLabel?.text = "Table View initialized: "
        return cell
    }

    private func activateTableViewConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

