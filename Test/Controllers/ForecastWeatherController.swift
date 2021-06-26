//
//  ForecastWeatherController.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import UIKit

class ForecastWeatherController: UIViewController {
    
    private let tableView = UITableView()
    
    private let model = ForecastWeatherModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        title = "Forecast"
        view.backgroundColor = .systemBackground
                
        tableView.register(ForecastWeatherCell.self, forCellReuseIdentifier: "ForecastWeatherCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        model.delegate = self
        model.updateData()
    }
    
}

extension ForecastWeatherController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getNumberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastWeatherCell", for: indexPath) as! ForecastWeatherCell
        
        
        
        return cell
    }
    
}

extension ForecastWeatherController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ForecastWeatherController: ForecastWeatherModelDelegate {
    
    func forecastWeatherModelDidUpdateData(_ forecastWeatherModel: ForecastWeatherModel) {
        tableView.reloadData()
    }
    
    func forecastWeatherModel(_ forecastWeatherModel: ForecastWeatherModel, didFailureUpdateData error: Error) {
        print(error)
    }
    
}
