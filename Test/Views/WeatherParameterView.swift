//
//  WeatherParameterView.swift
//  Test
//
//  Created by Дмитрий Разуев on 22.06.21.
//

import UIKit

class WeatherParameterView: UIView {
    
    private let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 40)))
    private let borderLayer = CAShapeLayer()
    private let descriptionLabel = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        imageView.contentMode = .scaleAspectFit
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = "-"
        
        let contentStackView = UIStackView(arrangedSubviews: [imageView, descriptionLabel])
        contentStackView.axis = .vertical
        contentStackView.spacing = 2
        contentStackView.distribution = .fill
        contentStackView.alignment = .center
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        borderLayer.strokeColor = UIColor.gray.cgColor
        borderLayer.lineDashPattern = [2, 2]
        borderLayer.fillColor = nil
        borderLayer.frame = imageView.bounds
        borderLayer.path = UIBezierPath(rect: imageView.bounds).cgPath
        imageView.layer.addSublayer(borderLayer)
        
        NSLayoutConstraint.activate([
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(image: UIImage, description: String) {
        imageView.image = image
        descriptionLabel.text = description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderLayer.frame = imageView.bounds
        borderLayer.path = UIBezierPath(rect: imageView.bounds).cgPath
    }
    
}
