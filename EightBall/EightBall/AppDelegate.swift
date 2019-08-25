//
//  AppDelegate.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = MainViewController(nibName:toString(MainViewController.self), bundle: Bundle.main)
        
        window.rootViewController = UINavigationController(rootViewController: controller)
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

