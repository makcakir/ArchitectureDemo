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
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initWindow()
        return true
    }
}

private extension AppDelegate {
    
    func initWindow() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        initMainScreen()
    }
    
    func initMainScreen() {
        window?.rootViewController = UINavigationController()
    }
}
