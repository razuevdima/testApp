//
//  TodayWeatherModel.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

class TodayWeatherModel {
    
    private(set) var shareWeather: String?
    
    func getWeather(completion: @escaping (Result<WeatherData, Error>) -> ()) {
        LocationManager.shared.getCurrentCoordinate { coordinate in
            WeatherAPI.shared.requestWeather(for: coordinate) { result in
                completion(result)
                if let weatherData = try? result.get() {
                    self.shareWeather = weatherData.name + " " + String(weatherData.main.temp) + " " + (weatherData.weather.first?.description ?? "")
                }
            }
        }
    }
    
}
