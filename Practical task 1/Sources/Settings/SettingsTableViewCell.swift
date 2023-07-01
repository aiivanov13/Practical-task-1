//
//  SettingsTableViewCell.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - UI Elements

    private let cellIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
