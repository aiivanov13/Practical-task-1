//
//  CustomNavigationView.swift
//  Practical task 1
//
//  Created by Александр Иванов on 02.07.2023.
//

import UIKit
import SnapKit

class CustomNavigationView: UINavigationBar {

    // MARK: - UI Elements

    private lazy var backButton: UIButton = {
        let button = UIButton(configuration: buttonConfiguration())
        button.addTarget(nil, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupView() {
        isUserInteractionEnabled = true
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 25
        layer.addShadows()
    }

    private func setupHierarchy() {
        addSubview(backButton)
    }

    private func setupLayout() {
        backButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(self).inset(12)
        }
    }

    // MARK: - Button Configuration

    private func buttonConfiguration() -> UIButton.Configuration {
        let image = UIImage(named: "backArrow")
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.image = image
        buttonConfiguration.title = "Settings"
        buttonConfiguration.baseForegroundColor = .black
        buttonConfiguration.imagePadding = 14
        buttonConfiguration.titleTextAttributesTransformer =
          UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
            return outgoing
          }
        return buttonConfiguration
    }

    // MARK: - Action

    @objc private func backButtonTapped() {
        (window?.rootViewController as? UINavigationController)?.popViewController(animated: true)
    }
}
