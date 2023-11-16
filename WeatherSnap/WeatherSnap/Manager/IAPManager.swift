// IAPManager.swift
// WeatherSnap
//
// Created by 김우섭 on 11/15/23.

import RevenueCat
import Foundation

/// 인앱 결제를 관리하는 IAPManager 클래스를 정의
final class IAPManager {
    
    static let shared = IAPManager()

    private init() {}
    
    /// 사용자가 구독 중인지 확인하는 메서드
    func isSubscribed(completion: @escaping (Bool) -> Void) {
        /// Purchases.shared를 사용하여 사용자의 구독 정보를 가져다.
        Purchases.shared.getCustomerInfo { info, error in
            /// 구독 정보에서 활성 구독 목록을 가져온다.
            guard let subscriptions = info?.activeSubscriptions else { return }
            /// 구독 목록이 비어있으면 사용자는 구독 중이 아니다
            /// completion 클로저를 호출하여 결과를 반환한다.
            completion(!subscriptions.isEmpty)
        }
    }
}
