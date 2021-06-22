//
//  WeatherData.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

struct WeatherData: Codable {
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Codable {
        let temp: Double
        let humidity: Int
        let pressure: Int
        let minTemp: Double
        let maxTemp: Double
        let feels: Double
        
        enum CodingKeys: String, CodingKey {
            case minTemp = "temp_min"
            case maxTemp = "temp_max"
            case humidity
            case temp
            case pressure
            case feels = "feels_like"
        }
    }
    
    struct Wind: Codable {
        let speed: Double
    }
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Sys: Codable {
        let country: String
    }
    
    let weather: [Weather]
    let main: Main
    let name: String
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
}
