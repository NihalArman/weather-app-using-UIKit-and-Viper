//
//  WeatherAPIService.swift
//  weather-app
//
//  Created by Arman Nihal on 3.5.2024.
//

import Foundation

class WeatherAPIService {
    func fetchWeatherDataFromAPI(completion: @escaping ((Error?, Bool, WeatherData?) -> Void)){
        guard let weatherAPIUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=joensuu&appid=32e06b8145a6663c8b586aabd45778a1") else {
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
