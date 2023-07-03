//
//  SettingsTableViewCell.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    private var isOn = false
    private let customSwitch = CustomSwitch()

    var option: Option? {
        didSet {
            cellIcon.image = option?.image
            titleLabel.text = option?.title
            descriptionLabel.text = option?.description
            switch option?.accessoryView {
            case .switcher:
                customSwitch.isHidden = false
            case .versionLabel:
                versionLabel.isHidden = false
            case .none:
                break
            }
        }
    }

    // MARK: - UI Elements

    private let cellIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let iconView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "imageBackgroundColor")
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 18)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
        label.textColor = UIColor(named: "accentGrayColor")
        return label
    }()

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = Option.version
        label.textColor = UIColor(named: "accentGrayColor")
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        iconView.addSubview(cellIcon)
        addSubview(iconView)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        addSubview(stack)
        addSubview(versionLabel)
        contentView.addSubview(customSwitch)
    }

    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(25)
            make.top.bottom.equalTo(self).inset(16)
            make.width.equalTo(iconView.snp.height)
        }

        cellIcon.snp.makeConstraints { $0.top.bottom.leading.trailing.equalTo(iconView).inset(12) }

        stack.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(19)
            make.centerY.equalTo(self)
        }

        versionLabel.snp.makeConstraints { make in
            make.top.trailing.equalTo(self).inset(25)
        }

        customSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.width.equalTo(47)
            make.height.equalTo(27)
            make.trailing.equalTo(contentView).inset(25)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.option = nil
    }
}
