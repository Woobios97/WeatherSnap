//
//  DailyWeatherCollectionViewCellViewModel.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import WeatherKit
import Foundation

struct DailyWeatherCollectionViewCellViewModel {
    private let model: DayWeather
    
    init(model: DayWeather) {
        self.model = model
    }
    
    public var iconName: String {
        return model.symbolName
    }
    
    public var temperature: String {
        return "\(model.lowTemperature.description) - \(model.highTemperature.description)"
    }
    
    public var day: String {
        let day = Calendar.current.component(.weekday, from: model.date)
        return string(from: day)
    }
    
    private func string(from day: Int) -> String {
        switch (day) {
        case 1:
            return "월요일"
        case 2:
            return "화요일"
        case 3:
            return "수요일"
        case 4:
            return "목요일"
        case 5:
            return "금요일"
        case 6:
            return "토요일"
        case 7:
            return "일요일"
        default:
            return "_"
        }
    }
}
