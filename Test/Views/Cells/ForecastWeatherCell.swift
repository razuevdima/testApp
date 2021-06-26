//
//  ForecastWeatherCell.swift
//  Test
//
//  Created by Дмитрий Разуев on 25.06.21.
//

import UIKit

class ForecastWeatherCell: UITableViewCell {
    
    private let weatherImageView = UIImageView()
    private let timeLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    private func setupCell() {
        selectionStyle = .none
        
        weatherImageView.contentMode = .scaleAspectFit
        
        timeLabel.text = "-"

        temperatureLabel.font = .systemFont(ofSize: 45)
        temperatureLabel.textColor = .systemTeal
        temperatureLabel.text = "-"
        temperatureLabel.textAlignment = .right
        
        let labelsStackView = UIStackView(arrangedSubviews: [timeLabel, descriptionLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        labelsStackView.distribution = .fillEqually
        
        let contentStackView = UIStackView(arrangedSubviews: [weatherImageView, labelsStackView, temperatureLabel])
        contentStackView.axis = .horizontal
        contentStackView.spacing = 24
        contentStackView.distribution = .fill
        contentStackView.alignment = .center
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            weatherImageView.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(list: ForecastData.List) {
        weatherImageView.image = UIImage(named: list.weather.first?.icon ?? "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeLabel.text = dateFormatter.string(from: list.date)
        descriptionLabel.text = list.weather.first?.description ?? ""
        temperatureLabel.text = String(Int(round(list.main.temp))) + "°C"
    }
    
}
