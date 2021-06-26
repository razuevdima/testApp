//
//  ForecastWeatherHeader.swift
//  Test
//
//  Created by Дмитрий Разуев on 26.06.21.
//

import UIKit

class ForecastWeatherHeader: UITableViewHeaderFooterView {
    
    private let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHeader()
    }
        
    private func setupHeader() {
        backgroundView?.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }
    
}
