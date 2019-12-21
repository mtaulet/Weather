//
//  WeatherData.swift
//  Weather
//
//  Created by Marta Taulet Sánchez on 12/20/19.
//  Copyright © 2019 Marta Taulet Sánchez. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
