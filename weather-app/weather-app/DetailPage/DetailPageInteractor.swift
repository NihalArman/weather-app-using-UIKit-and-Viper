//
//  DetailPageInteractor.swift
//  weather-app
//
//  Created by Arman Nihal on 25.5.2024.
//

import Foundation

protocol DetailPageInteractorProtocol {
    var presenter: DetailPagePresenterProtocol? { get set }
}

class DetailPageInteractor: DetailPageInteractorProtocol {
    var presenter: DetailPagePresenterProtocol?
}
