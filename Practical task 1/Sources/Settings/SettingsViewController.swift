//
//  SettingsViewController.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    private var options: [Option]?
    private let customNavigationView = CustomNavigationView()

    // MARK: - UI Elements

    private lazy var notificationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "mainColor")
        view.layer.cornerRadius = 20
        view.layer.addShadows(color: UIColor(named: "mainColor")?.cgColor)
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
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: 92, bottom: .zero, right: 25)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        options = Option.options
        setupView()
        setupHierarchy()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }

    private func setupHierarchy() {
        view.addSubview(customNavigationView)
        notificationStack.addArrangedSubview(descriptionLabel)
        notificationStack.addArrangedSubview(titleLabel)
        notificationView.addSubview(notificationStack)
        notificationView.addSubview(notificationImage)
        view.addSubview(notificationView)
        view.addSubview(tableView)
    }

    private func setupLayout() {
        customNavigationView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view)
            make.height.equalTo(110)
        }
        
        notificationView.snp.makeConstraints { make in
            make.top.equalTo(customNavigationView.snp.bottom)
            make.leading.trailing.equalTo(view).inset(25)
            make.height.equalTo(88)
        }

        notificationImage.snp.makeConstraints { make in
            make.top.equalTo(notificationView.snp.top).offset(-11)
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
        options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }

        if options?[indexPath.row] == options?.last {
            cell.separatorInset = UIEdgeInsets(top: .zero, left: view.bounds.width, bottom: .zero, right: .zero)
        }

        cell.option = options?[indexPath.row]

        return cell
    }
}

// MARK: - UITableView Delegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        81
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
