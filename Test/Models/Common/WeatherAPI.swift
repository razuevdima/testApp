//
//  WeatherAPI.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import Foundation

class WeatherAPI {
    
    private let session = URLSession.shared
    
    static let shared = WeatherAPI()
    
    private init() {
        
    }
    
    func requestWeather(for coordinate: LocationManager.Coordinate, completion: @escaping (Result<WeatherData, Error>) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=ba3f53e5ea26b71f8da0e4c29054f91e&lang=ru&units=metric") else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(weatherData))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}
