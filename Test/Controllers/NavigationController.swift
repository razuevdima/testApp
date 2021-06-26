//
//  NavigationController.swift
//  Test
//
//  Created by Дмитрий Разуев on 26.06.21.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        navigationBar.shadowImage = getNavigationShadowImage()
    }
    
    private func getNavigationShadowImage() -> UIImage? {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 3)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIImage(named: "navigationShadow")?.draw(in: CGRect(origin: .zero, size: size))
        
        let shadowImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return shadowImage
    }
    
}
