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

class DetailPageViewController: UIViewController, DetailPageViewControllerProtocol {

    var presenter: DetailPagePresenterProtocol?

    var weatherDetailData: WeatherData = WeatherData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        weatherDetailData = presenter!.getDetailInformation()

        self.navigationItem.title = self.weatherDetailData.name
    }
}
