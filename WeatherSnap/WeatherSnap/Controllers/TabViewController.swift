//
//  TabViewController.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import UIKit

final class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab1 = WeatherViewController()
        tab1.title = "날씨"
        let tab2 = SettingsViewController()
        tab2.title = "세팅"
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        
        nav1.tabBarItem = UITabBarItem(title: "날씨", image: UIImage(systemName: "rainbow"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "세팅", image: UIImage(systemName: "gear"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
