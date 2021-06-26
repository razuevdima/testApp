//
//  AppDelegate.swift
//  Test
//
//  Created by Дмитрий Разуев on 20.06.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let todayWeatherController = TodayWeatherController()
        let todayWeatherNavigationController = NavigationController(rootViewController: todayWeatherController)
        let todayWeatherTabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "sun.max"), tag: 0)
        todayWeatherNavigationController.tabBarItem = todayWeatherTabBarItem
        
        let forecastWeatherController = ForecastWeatherController()
        let forecastWeatherNavigationController = NavigationController(rootViewController: forecastWeatherController)
        let forecastWeatherTabBarItem = UITabBarItem(title: "Forecast", image: UIImage(systemName: "thermometer"), tag: 1)
        forecastWeatherNavigationController.tabBarItem = forecastWeatherTabBarItem
        
        let tabBarViewController = UITabBarController()
        tabBarViewController.setViewControllers([todayWeatherNavigationController, forecastWeatherNavigationController], animated: false)
        tabBarViewController.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = tabBarViewController
        window?.makeKeyAndVisible()
        
        LocationManager.shared.start()
        
        return true
    }

}
