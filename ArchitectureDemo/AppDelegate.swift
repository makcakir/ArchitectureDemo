//
//  AppDelegate.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 05/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    var navigationController: UINavigationController?

    open class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindow()
        initializeMainScreen()
        return true
    }
}

private extension AppDelegate {
    
    func initializeWindow() {
        navigationController = UINavigationController()

        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func initializeMainScreen() {
        let initializer = ArchitectureDemoInitializer()
        initializer.initializeDemoScreen()
    }
}
