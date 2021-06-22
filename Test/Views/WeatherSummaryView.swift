//
//  WeatherSummaryView.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import UIKit

class WeatherSummaryView: UIView {
    
    private let imageView = UIImageView()
    private let locationLabel = UILabel()
    private let weatherLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        imageView.contentMode = .scaleAspectFit
        
        locationLabel.text = "-"

        weatherLabel.font = .systemFont(ofSize: 29)
        weatherLabel.textColor = .systemTeal
        weatherLabel.text = "-"
        
        let contentStackView = UIStackView(arrangedSubviews: [imageView, locationLabel, weatherLabel])
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        contentStackView.distribution = .fill
        contentStackView.alignment = .center
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setup(weatherData: WeatherData) {
        imageView.image = UIImage(named: weatherData.weather.first?.icon ?? "")
        locationLabel.text = weatherData.name + ", " + weatherData.sys.country
        weatherLabel.text = String(Int(round(weatherData.main.temp))) + "°C | " + (weatherData.weather.first?.description ?? "")
    }
    
}
