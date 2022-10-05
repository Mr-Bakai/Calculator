//
//  AppDelegate.swift
//  Calculator
//
//  Created by Bakai Ismailov on 5/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        regularLaunching()

        return true
    }

    private func regularLaunching() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
                
        self.window!.rootViewController = ViewController()
        self.window!.makeKeyAndVisible()
    }
}
