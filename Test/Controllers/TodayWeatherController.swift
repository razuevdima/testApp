//
//  TodayWeatherController.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import UIKit

class TodayWeatherController: UIViewController {
    
    private let model = TodayWeatherModel()
    
    private let weatherSummaryView = WeatherSummaryView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        view.backgroundColor = .systemBackground
        
        let contentStackView = UIStackView(arrangedSubviews: [weatherSummaryView])
        contentStackView.axis = .vertical
        contentStackView.spacing = 0
        contentStackView.distribution = .fill
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        model.getWeather { result in
            print(result)
        }
        
    }
    
}
