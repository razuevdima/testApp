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
        timeLabel.text = "11:00"
        descriptionLabel.text = "cloudly"
        
        let labelsStackView = UIStackView(arrangedSubviews: [timeLabel, descriptionLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        labelsStackView.distribution = .fillEqually
        
        let contentStackView = UIStackView(arrangedSubviews: [weatherImageView, labelsStackView, temperatureLabel])
        contentStackView.axis = .horizontal
        contentStackView.spacing = 24
        contentStackView.distribution = .fill
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
