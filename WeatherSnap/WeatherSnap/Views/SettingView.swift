//
//  SettingView.swift
//  WeatherSnap
//
//  Created by 김우섭 on 11/15/23.
//

import UIKit

/// SettingView에서의 사용자 인터렉션 처리를 위해 SettingViewController로 이벤트전달
protocol SettingViewDelegate: AnyObject {
    func settingView(_ settingView: SettingView, didTap option: SettingOption)
}

final class SettingView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: SettingViewDelegate?
    
    private var viewModel: SettingViewViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: SettingViewViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.option.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let viewModel {
            cell.textLabel?.text = viewModel.option[indexPath.row].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewModel else {
            return
        }
        let option = viewModel.option[indexPath.row]
        // Handle top
        delegate?.settingView(self, didTap: option)
    }
}
