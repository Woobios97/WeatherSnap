//
//  LocationManager.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    static let shared = LocationManager()
    
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    private var location: CLLocation? {
        didSet {
            guard let location else {
                return
            }
            locationFetchCompletion?(location)
        }
    }
    
    /// - Parameter completion: 외부에서 위치 정보를 요청
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        
        self.locationFetchCompletion = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    // MARK: - 위치
    
    /// - Parameters:
    ///   - manager: CLLocationManager
    ///   - locations: 위치정보가 업데이트될 때마다 호출된다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.location = location
        manager.stopUpdatingLocation()
    }
    
}
