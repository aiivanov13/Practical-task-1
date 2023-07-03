//
//  CustomSwitch.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit
import SnapKit

class CustomSwitch: UIView {
    var isOn = false

    // MARK: - UI Elements

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "accentGrayColor")?.withAlphaComponent(0.3)
        view.layer.cornerRadius = 9
        return view
    }()

    private lazy var border: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        return view
    }()

    private lazy var switcher: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "accentGrayColor")?.withAlphaComponent(0.6)
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        return view
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 47, height: 27)))
        setupView()
        setupHierarchy()
        setupLayout()
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        isHidden = true
        isUserInteractionEnabled = true
        layer.addShadows()
        layer.shadowRadius = 10
    }

    private func setupHierarchy() {
        addSubview(backgroundView)
        border.addSubview(switcher)
        addSubview(border)
    }

    private func setupLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(5)
            make.leading.trailing.equalTo(self).inset(3)
        }

        border.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.equalTo(self).offset(-3)
            make.width.equalTo(33)
        }

        switcher.snp.makeConstraints { $0.leading.trailing.top.bottom.equalTo(border).inset(6) }
    }

    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(gesture)
    }

    // MARK: - Action

    @objc private func tapped(){
        isOn.toggle()

        if isOn {
            border.snp.remakeConstraints { make in
                make.top.bottom.equalTo(self)
                make.trailing.equalTo(self).offset(3)
                make.width.equalTo(33)
            }
            switcher.backgroundColor = UIColor(named: "mainColor")
        } else {
            border.snp.remakeConstraints { make in
                make.top.bottom.equalTo(self)
                make.leading.equalTo(self).offset(-3)
                make.width.equalTo(33)
            }
            switcher.backgroundColor = UIColor(named: "accentGrayColor")?.withAlphaComponent(0.5)
        }
    }
}
