//
//  SettingsViewController.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var notificationView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var notificationImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var tableView: UITableView = {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {

    }

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }
}

// MARK: - UITableVIew DataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

// MARK: - UITableView Delegate

extension SettingsViewController: UITableViewDelegate {

}
