//
//  WeatherAPIService.swift
//  weather-app
//
//  Created by Arman Nihal on 3.5.2024.
//

import Foundation

class WeatherAPIService {
    func fetchWeatherDataFromAPI(completion: @escaping ((Error?, Bool, WeatherData?) -> Void)){
        guard let weatherAPIUrl = URL(string: Keys.OPEN_WEATHER_API_KEYS) else {
            print("Error in the URL")
            completion(nil, false, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: weatherAPIUrl) { data, response, error in
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
