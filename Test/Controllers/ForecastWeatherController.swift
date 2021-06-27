//
//  ForecastWeatherController.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import UIKit

class ForecastWeatherController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let model = ForecastWeatherModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        title = "Forecast"
        view.backgroundColor = .systemBackground
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 92, bottom: 0, right: 0)
        tableView.register(ForecastWeatherCell.self, forCellReuseIdentifier: "ForecastWeatherCell")
        tableView.register(ForecastWeatherHeader.self, forHeaderFooterViewReuseIdentifier: "ForecastWeatherHeader")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
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
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
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
        
        let list = model.getList(for: indexPath)
        cell.setup(list: list)
        
        return cell
    }
    
}

extension ForecastWeatherController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ForecastWeatherHeader") as! ForecastWeatherHeader
        
        let title = model.getTitle(for: section)
        header.setup(title: title)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
}

extension ForecastWeatherController: ForecastWeatherModelDelegate {
    
    func forecastWeatherModelDidUpdateData(_ forecastWeatherModel: ForecastWeatherModel) {
        tableView.reloadData()
        navigationItem.title = model.cityName
    }
    
    func forecastWeatherModel(_ forecastWeatherModel: ForecastWeatherModel, didFailureUpdateData error: Error) {
        showErrorAlert(message: error.localizedDescription)
    }
    
}
