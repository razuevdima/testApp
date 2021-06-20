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
        let contentStackView = UIStackView(arrangedSubviews: [imageView, locationLabel, weatherLabel])
        contentStackView.axis = .vertical
        contentStackView.spacing = 4
        contentStackView.distribution = .fill
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

