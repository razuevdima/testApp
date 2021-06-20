//
//  TodayWeatherModel.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

class TodayWeatherModel {
    
    func getWeather(completion: @escaping (Result<WeatherData, Error>) -> ()) {
        LocationManager.shared.getCurrentCoordinate { coordinate in
            WeatherAPI.shared.requestWeather(for: coordinate, completion: completion) 
        }
    }
    
}
