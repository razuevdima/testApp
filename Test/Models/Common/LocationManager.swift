//
//  LocationManager.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import CoreLocation

class LocationManager: NSObject {
    
    typealias CoordinateCompletion = (Coordinate) -> ()
    
    struct Coordinate {
        let latitude: Double
        let longitude: Double

    }
    
    private var lastCoordinate: Coordinate?
    
    private var completions = [CoordinateCompletion]()
    
    private let locationManager = CLLocationManager()
    
    static let shared = LocationManager()
    
    private override init() {
        
    }
    
    func start() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.requestLocation()
        }
    }
    
    func getCurrentCoordinate(completion: @escaping CoordinateCompletion) {
        if let lastCoordinate = lastCoordinate {
            completion(lastCoordinate)
        } else {
            completions.append(completion)
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        let lastCoordinate = Coordinate(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
        self.lastCoordinate = lastCoordinate
        manager.stopUpdatingLocation()
        for completion in completions {
            completion(lastCoordinate)
        }
        completions.removeAll()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
