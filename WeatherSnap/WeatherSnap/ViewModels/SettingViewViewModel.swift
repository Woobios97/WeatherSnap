//
//  SettingViewViewModel.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import Foundation

struct SettingViewViewModel {
    let option: [SettingOption]
}

enum SettingOption: CaseIterable {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
        case .upgrade:
            return "Pro로 업그레이드"
        case .privacyPolicy:
            return "개인정보 보호정책"
        case .terms:
            return "이용약관"
        case .contact:
            return "Contact Us"
        case .getHelp:
            return "도움"
        case .rateApp:
            return "앱 평가 📝"
        }
    }
}
