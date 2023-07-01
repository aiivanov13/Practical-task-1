//
//  SettingsViewController.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var notificationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "mainColor")
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    private lazy var notificationImage: UIImageView = {
        let image = UIImage(named: "bell")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Turn on notification"
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 21)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Update your settings"
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    private lazy var notificationStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .cyan
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        title = "Settings"
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationController?.navigationBar.clipsToBounds = true
        let backButton = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationController?.navigationBar.backItem?.title = ""
        let newBackButton = UIBarButtonItem(title: "Settings", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = newBackButton
    }

    private func setupHierarchy() {
        notificationStack.addArrangedSubview(descriptionLabel)
        notificationStack.addArrangedSubview(titleLabel)
        notificationView.addSubview(notificationStack)
        notificationView.addSubview(notificationImage)
        view.addSubview(notificationView)
        view.addSubview(tableView)
    }

    private func setupLayout() {
        notificationView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.leading.trailing.equalTo(view).inset(25)
            make.height.equalTo(88)
        }

        notificationImage.snp.makeConstraints { make in
            make.top.equalTo(notificationView.snp.top)
            make.trailing.equalTo(notificationView).inset(18)
            make.width.height.equalTo(72)
        }

        notificationStack.snp.makeConstraints { make in
            make.leading.equalTo(notificationView).inset(25)
            make.centerY.equalTo(notificationView)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(notificationView.snp_bottomMargin).offset(28)
            make.leading.trailing.bottom.equalTo(view)
        }
    }
}

// MARK: - UITableVIew DataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

// MARK: - UITableView Delegate

extension SettingsViewController: UITableViewDelegate {

}
