//
//  ForecastData.swift
//  Test
//
//  Created by Дмитрий Разуев on 23.06.21.
//

import Foundation

struct ForecastData: Codable {
    
    struct List: Codable {
        let date: Date
        let weather: [Weather]
        let main: Main
        
        enum CodingKeys: String, CodingKey {
            case date = "dt_txt"
            case weather
            case main
        }
    }
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Weather: Codable {
        let description: String
        let icon: String
    }
    
    struct City: Codable {
        let name: String
    }
    
    let list: [List]
    let city: City
    
}
