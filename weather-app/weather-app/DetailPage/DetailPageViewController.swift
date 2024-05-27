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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Detail information"
    }
}
