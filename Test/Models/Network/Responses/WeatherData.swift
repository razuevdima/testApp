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
    }
    
    let weather: [Weather]
    let main: Main
    let name: String 
    
}
