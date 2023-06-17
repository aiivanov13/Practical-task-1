//
//  ViewController.swift
//  Practical task 1
//
//  Created by Александр Иванов on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 139),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 88),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -87)
        ])
    }
}
