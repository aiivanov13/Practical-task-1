//
//  CellModel.swift
//  Practical task 1
//
//  Created by Александр Иванов on 01.07.2023.
//

import UIKit

enum AccessoryView {
    case switcher
    case versionLabel
}

struct Option {
    var image: UIImage?
    var title: String?
    var description: String?
    var accessoryView: AccessoryView?
    static var version: String = "v2.0.21"

    init(
        image: UIImage? = UIImage(named: "defaultImage"),
        title: String? = "Settings title here",
        description: String? = "Settings status",
        accessoryView: AccessoryView? = nil
    ) {
        self.image = image
        self.title = title
        self.description = description
        self.accessoryView = accessoryView
    }
}

extension Option {
    static var options: [Option] = [
        Option(accessoryView: .switcher),
        Option(title: "Notification", accessoryView: .switcher),
        Option(),
        Option(),
        Option(),
        Option(title: "About this app", accessoryView: .versionLabel),
    ]
}
