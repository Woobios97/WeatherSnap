//
//  WeatherViewModel.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import Foundation

enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModel: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModel: [DailyWeatherCollectionViewCellViewModel])
}
