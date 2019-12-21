//
//  WeatherManager.swift
//  Weather
//
//  Created by Marta Taulet Sánchez on 12/20/19.
//  Copyright © 2019 Marta Taulet Sánchez. All rights reserved.
//

let APIKey = "my-api-key"

import Foundation


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIKey)&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString: String) {
        // 1. Create url
        if let url = URL(string: urlString) {
            
            // 2. Create url session
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // 4. Start task
            task.resume()
            
        }
        
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
        
        
    }
}
