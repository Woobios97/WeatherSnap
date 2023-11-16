//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import WeatherKit
import Foundation

struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var temperature: String {
        let temperatureInCelsius = model.temperature.converted(to: .celsius).value
        return String(format: "%.2f °C", temperatureInCelsius)
    }
    
    public var iconName: String {
        return model.symbolName
    }
}
