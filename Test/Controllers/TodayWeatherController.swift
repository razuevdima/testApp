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
    private let weatherDetailsView = WeatherDetailsView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        title = "Today"
        view.backgroundColor = .systemBackground
                
        let shareButton = UIButton()
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.orange, for: .normal)
        shareButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            shareButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let contentStackView = UIStackView(arrangedSubviews: [weatherSummaryView, getSeparatorView(), weatherDetailsView, getSeparatorView(), shareButton])
        contentStackView.axis = .vertical
        contentStackView.spacing = 15
        contentStackView.distribution = .fill
        contentStackView.alignment = .center
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            weatherDetailsView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor)
        ])
        
        model.getWeather { result in
            switch result {
            case .success(let weatherData):
                self.weatherDetailsView.setup(weatherData: weatherData)
                self.weatherSummaryView.setup(weatherData: weatherData)
            case .failure(let error):
                self.showErrorAlert(message: error.localizedDescription)
            }
        }
        
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    private func getSeparatorView() -> UIView {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.gray
        
        NSLayoutConstraint.activate([
            separatorView.widthAnchor.constraint(equalToConstant: 200),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        return separatorView
    }
    
    @objc private func didButtonClick() {
        guard let shareWeather = model.shareWeather else { return }
        let activityController = UIActivityViewController(activityItems: [shareWeather], applicationActivities: nil)
        present(activityController, animated: true)
    }
    
}
