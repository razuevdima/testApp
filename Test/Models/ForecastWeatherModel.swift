//
//  ForecastWeatherModel.swift
//  Test
//
//  Created by Дмитрий Разуев on 23.06.21.
//

import Foundation

protocol ForecastWeatherModelDelegate: class {
    func forecastWeatherModelDidUpdateData(_ forecastWeatherModel: ForecastWeatherModel)
    func forecastWeatherModel(_ forecastWeatherModel: ForecastWeatherModel, didFailureUpdateData error: Error)
}

class ForecastWeatherModel {
    
    weak var delegate: ForecastWeatherModelDelegate?
    
    private var forecastData: ForecastData?
    
    private var data = [[ForecastData.List]]()
    
    func updateData() {
        LocationManager.shared.getCurrentCoordinate { coordinate in
            WeatherAPI.shared.requestForecast(for: coordinate) { result in
                switch result {
                case .success(let forecastData):
                    self.forecastData = forecastData
                    
                    var days = [Int: [ForecastData.List]]()
                    let calendar = Calendar.current
                    for list in forecastData.list {
                        let id = Int(calendar.startOfDay(for: list.date).timeIntervalSince1970)
                        days[id, default: []].append(list)
                    }
                    let sortedDays = days.sorted { element1, element2 in
                        return element1.key < element2.key
                    }
                    for sortedDay in sortedDays {
                        self.data.append(sortedDay.value.sorted(by: { $0.date < $1.date  }))
                    }
                    
                    self.delegate?.forecastWeatherModelDidUpdateData(self)
                case .failure(let error):
                    self.delegate?.forecastWeatherModel(self, didFailureUpdateData: error)
                }
            }
        }
    }
    
    func getNumberOfSections() -> Int {
        return data.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return data[section].count
    }
    
}

