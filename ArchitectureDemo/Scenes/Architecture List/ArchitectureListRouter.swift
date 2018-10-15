//
//  ArchitectureListRouter.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 12/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

class ArchitectureListRouter { }

extension ArchitectureListRouter: ArchitectureListRoutingProtocol {

    func routeToMvcScreen(title: String) {
        let viewController = MVCFibonacciViewController()
        viewController.title = title

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.pushViewController(viewController, animated: true)
    }

    func routeToMvvmScreen(title: String) {
        let viewController = MVVMFibonacciViewController()
        viewController.title = title
        #warning ("Add view model")

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.pushViewController(viewController, animated: true)
    }

    func routeToViperScreen(title: String) {
        let viewController = VIPERFibonacciViewController()
        viewController.title = title
        #warning ("Add VIPER module")

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
