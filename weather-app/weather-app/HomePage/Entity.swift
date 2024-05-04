//
//  Model.swift
//  weather-app
//
//  Created by Arman Nihal on 28.4.2024.
//

import Foundation

struct WeatherData: Decodable {
    var coord: CoordinatesResponse?
    var weather: [WeatherResponse]?
    var main: MainResponse?
    var name: String?
    var wind: WindResponse?
    
    init() {
        self.coord = nil
        self.weather = nil
        self.main = nil
        self.name = nil
        self.wind = nil
    }

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
