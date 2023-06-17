//
//  AppDelegate.swift
//  Practical task 1
//
//  Created by Александр Иванов on 10.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        return true
    }
}
