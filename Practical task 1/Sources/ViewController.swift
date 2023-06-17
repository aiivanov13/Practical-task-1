//
//  ViewController.swift
//  Practical task 1
//
//  Created by Александр Иванов on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    // Фоновое изображение
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Keytar sweenet"
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Portland ugh fashion axe Helvetica. Echo \n Park Austin gastropub roof party."
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.11, green: 0.13, blue: 0.18, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var interestedButton: UIButton = {
        let button = UIButton()
        button.setTitle("I'm interested", for: .normal)
        button.titleLabel?.font = UIFont(name: "GTWalsheimPro-Medium", size: 15)
        button.backgroundColor = UIColor(red: 1, green: 0.2, blue: 0.471, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.addShadows()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(interestedButton)

        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupView() {
        view.backgroundColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00)
    }

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(descriptionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.17),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (view.bounds.width - (view.bounds.width * 0.53)) / 2),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.bounds.width - (view.bounds.width * 0.53)) / 2),
            backgroundImageView.heightAnchor.constraint(equalToConstant: backgroundImageView.bounds.width * 1.15),
            descriptionView.heightAnchor.constraint(equalToConstant: 270),
            descriptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -31),
            descriptionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (view.bounds.width - (view.bounds.width * 0.92)) / 2),
            descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.bounds.width - (view.bounds.width * 0.92)) / 2),
            titleLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 34),
            titleLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            descriptionLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: (view.bounds.width - (view.bounds.width * 0.83)) / 2),
            descriptionLabel.rightAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: -(view.bounds.width - (view.bounds.width * 0.83)) / 2),
            interestedButton.heightAnchor.constraint(equalToConstant: 48),
            interestedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            interestedButton.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: (view.bounds.width - (view.bounds.width * 0.74)) / 2),
            interestedButton.rightAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: -(view.bounds.width - (view.bounds.width * 0.74)) / 2)
        ])
    }
}
