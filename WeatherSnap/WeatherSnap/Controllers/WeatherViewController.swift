//
//  WeatherViewController.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import RevenueCat
import RevenueCatUI
import UIKit
import WeatherKit

final class WeatherViewController: UIViewController {
    
    /// 현재 날씨를 표시하는 뷰
    private let primaryView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getLocation()
    }
    
    @objc func didTapUpgrade() {
        let vc = PaywallViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    /// 사용자의 현재위치를 가져와 해당 위치에 대한 날씨 정보 요청 후 뷰에 표시
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    /// 현재 날씨 정보를 뷰 모델로 변환하고 화면에 표시합니다
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    self?.createViewModels(currentWeather: currentWeather)
                }
            }
        }
    }
    
    /// 날씨 정보를 뷰 모델로 변환하고 화면에 표시하는 메서드
    private func createViewModels(currentWeather: CurrentWeather) {
        var viewModels: [WeatherViewModel] = [
            .current(viewModel: .init(model: currentWeather)),
            .hourly(viewModel: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0) })),
        ]
        primaryView.configure(with: viewModels)
        
        /// 사용자가 구독 중인지 확인하고, 구독 중인 경우 데일리 날씨 정보를 추가로 표시하고 업그레이드 버튼을 제거
        IAPManager.shared.isSubscribed { [weak self] subscribed in
            if subscribed {
                viewModels.append(
                    .daily(viewModel: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0) }))
                )
                
                DispatchQueue.main.async {
                    self?.primaryView.configure(with: viewModels)
                    self?.navigationItem.rightBarButtonItem = nil
                }
            } else {
                DispatchQueue.main.async {
                    self?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "wand.and.stars.inverse"), style: .done, target: self, action: #selector(self?.didTapUpgrade))
                }
            }
        }
    }
    
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

/// PaywallViewControllerDelegate 프로토콜을 준수하도록 확장
extension WeatherViewController: PaywallViewControllerDelegate {
    /// 구매가 완료된 경우 호출되는 메서드
    func paywallViewController(_ controller: PaywallViewController, didFinishPurchasingWith customerInfo: CustomerInfo) {
        controller.dismiss(animated: true)
        /// 구매가 완료되면 현재 날씨 정보를 업데이트
        guard let currentWeather = WeatherManager.shared.currentWeather else { return }
        createViewModels(currentWeather: currentWeather)
    }
    /// 복원이 완료된 경우 호출되는 메서드
    func paywallViewController(_ controller: PaywallViewController, didFinishRestoringWith customerInfo: CustomerInfo) {
        print(#fileID, #function, #line, "this is - \(customerInfo)")
        controller.dismiss(animated: true)
    }
    
}
