//
//  WeatherAPIService.swift
//  weather-app
//
//  Created by Arman Nihal on 3.5.2024.
//

import Foundation

protocol WeatherAPIServiceProtocol {
    func fetchWeatherDataFromAPI(city: String, completion: @escaping ((Error?, Bool, WeatherData?) -> Void))
}

class WeatherAPIService: WeatherAPIServiceProtocol {
    func fetchWeatherDataFromAPI(city: String, completion: @escaping (((any Error)?, Bool, WeatherData?) -> Void)) {
    }
    
}

extension URLSession: WeatherAPIServiceProtocol {
    func fetchWeatherDataFromAPI(city: String, completion: @escaping (((any Error)?, Bool, WeatherData?) -> Void)) {
        guard let weatherAPIUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + Keys.OPEN_WEATHER_API_KEYS) else {
            print("Error in the URL")
            completion(nil, false, nil)
            return
        }

        let task = self.dataTask(with: weatherAPIUrl) { data, response, error in
            if let error = error {
                completion(error, false, nil)
                return
            }

            guard let data = data, let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                completion(nil, false, nil)
                return
            }
            completion(nil, true, weatherData)
        }
        task.resume()
    }
}
