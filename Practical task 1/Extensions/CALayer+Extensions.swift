//
//  CALayer + Extensions.swift
//  Practical task 1
//
//  Created by Александр Иванов on 17.06.2023.
//

import UIKit

extension CALayer {
    func addShadows(color: CGColor? = UIColor.black.cgColor) {
        self.shadowColor = color
        self.shadowOpacity = 0.15
        self.shadowOffset = CGSize(width: 0, height: 12)
        self.shadowRadius = 36
        self.shouldRasterize = true
        self.rasterizationScale = UIScreen.main.scale
    }
}
