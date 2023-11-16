//
//  SettingsViewController.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private let primaryView : SettingView = {
        let view = SettingView()
        let viewModel = SettingViewViewModel(option: SettingOption.allCases)
        view.configure(with: viewModel)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        setUpView()
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

extension SettingsViewController: SettingViewDelegate {
    func settingView(_ settingView: SettingView, didTap option: SettingOption) {
        switch option {
        case .upgrade:
            break
        case .privacyPolicy:
            break
        case .terms:
            break
        case .contact:
            break
        case .getHelp:
            break
        case .rateApp:
            break
        }
    }
}
