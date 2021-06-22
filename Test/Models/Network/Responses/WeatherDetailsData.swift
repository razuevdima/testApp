//
//  WeatherDetailsData.swift
//  Test
//
//  Created by Дмитрий Разуев on 21.06.21.
//

struct WeatherDetailsData: Codable {
    
    struct Main: Codable {
        let minTemp: Double
        let maxTemp: Int
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case minTemp = "temp_min"
            case maxTemp = "temp_max"
            case humidity
        }
    }
    
    struct Wind: Codable {
        let speed: Double
    }
    
    struct Clouds: Codable {
        let all: Int
    }
    
    let main: Main
    let wind: Wind
    let clouds: Clouds
}
