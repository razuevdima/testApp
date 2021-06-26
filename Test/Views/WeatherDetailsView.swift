//
//  WeatherDetailsView.swift
//  Test
//
//  Created by Дмитрий Разуев on 21.06.21.
//

import UIKit

class WeatherDetailsView: UIView {
    
    private let minTempWeatherParameterView = WeatherParameterView(frame: .zero)
    private let maxTempWeatherParameterView = WeatherParameterView(frame: .zero)
    private let feelWeatherParameterView = WeatherParameterView(frame: .zero)
    private let windSpeedWeatherParameterView = WeatherParameterView(frame: .zero)
    private let cloudsWeatherParameterView = WeatherParameterView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let firstLineStackView = UIStackView(arrangedSubviews: [minTempWeatherParameterView, maxTempWeatherParameterView, feelWeatherParameterView])
        firstLineStackView.axis = .horizontal
        firstLineStackView.spacing = 0
        firstLineStackView.distribution = .fillEqually
        
        let secondLineStackView = UIStackView(arrangedSubviews: [windSpeedWeatherParameterView, cloudsWeatherParameterView])
        secondLineStackView.axis = .horizontal
        secondLineStackView.spacing = 0
        secondLineStackView.distribution = .fillEqually
        
        let contentStackView = UIStackView(arrangedSubviews: [firstLineStackView, secondLineStackView])
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        contentStackView.distribution = .fillEqually
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(weatherData: WeatherData) {
        minTempWeatherParameterView.setup(image: UIImage(named: "minTemp")!, description: "\(weatherData.main.minTemp) °C")
        maxTempWeatherParameterView.setup(image: UIImage(named: "maxTemp")!, description: "\(weatherData.main.maxTemp) °C")
        feelWeatherParameterView.setup(image: UIImage(named: "humidity")!, description: "\(weatherData.main.humidity) %")
        windSpeedWeatherParameterView.setup(image: UIImage(named: "windSpeed")!, description: "\(weatherData.wind.speed) km/h")
        cloudsWeatherParameterView.setup(image: UIImage(named: "clouds")!, description: "\(weatherData.clouds.all) %")
    }
    
}
