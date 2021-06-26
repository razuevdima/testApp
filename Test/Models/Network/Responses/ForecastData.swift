//
//  ForecastData.swift
//  Test
//
//  Created by Дмитрий Разуев on 23.06.21.
//

import Foundation

struct ForecastData: Codable {
    
    struct List: Codable {
        let main: Main
        let weather: [Weather]
        let date: Date
        
        var day: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM.dd.yyyy"
            return formatter.string(from: date)
        }
        
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
    
    let list: [List]
}
