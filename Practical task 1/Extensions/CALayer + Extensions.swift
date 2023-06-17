//
//  CALayer + Extensions.swift
//  Practical task 1
//
//  Created by Александр Иванов on 17.06.2023.
//

import UIKit

extension CALayer {
    func addShadows() {
        self.shadowColor = UIColor.black.cgColor
        self.shadowOpacity = 0.15
        self.shadowOffset = CGSize(width: 0, height: 12)
        self.shadowRadius = 36
    }
}
