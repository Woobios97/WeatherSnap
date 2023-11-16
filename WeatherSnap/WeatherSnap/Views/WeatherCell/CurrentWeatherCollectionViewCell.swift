//
//  CurrentWeatherCollectionViewCell.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import UIKit

final class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 62, weight: .medium)
        return label
    }()
    
    private let conditionalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .regular)
        return label
    }()
    
    private let icon: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(tempLabel)
        contentView.addSubview(conditionalLabel)
        contentView.addSubview(icon)
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tempLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            icon.heightAnchor.constraint(equalToConstant: 55),
            icon.widthAnchor.constraint(equalToConstant: 55),
            icon.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            conditionalLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 10),
            conditionalLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            conditionalLabel.heightAnchor.constraint(equalToConstant: 80),
            conditionalLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15),
            conditionalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        conditionalLabel.text = nil
        tempLabel.text = nil
        icon.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        conditionalLabel.text = viewModel.condition
        tempLabel.text = viewModel.temperature
    }
}
