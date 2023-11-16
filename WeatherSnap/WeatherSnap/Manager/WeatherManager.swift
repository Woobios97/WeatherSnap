//
//  WeatherManager.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import CoreLocation
import Foundation
import WeatherKit

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    
    private init() {}
    
    public func getWeather(for loaction: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: loaction)
               
                self.currentWeather = result.currentWeather
                self.dailyWeather = result.dailyForecast.forecast
                self.hourlyWeather = result.hourlyForecast.forecast
                completion()
            } catch {
                print(#fileID, #function, #line, "\n\nthis is - Error \(error)")
            }
        }
    }
}
