//
//  ArchitectureListRouter.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 12/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

class ArchitectureListRouter {

    func initializeListScreen() {
        let viewController = ArchitectureListViewController()
        viewController.presenter = ArchitectureListPresenter(router: ArchitectureListRouter())
        #warning ("Use interactor data!")
        viewController.architectures = [ArchitecturePresentation(title: "MCV", detail: "qwe"),
                                        ArchitecturePresentation(title: "MVVM", detail: "asd"),
                                        ArchitecturePresentation(title: "VIPER", detail: "zxc")]

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.viewControllers = [viewController]
    }
}

extension ArchitectureListRouter: ArchitectureListRoutingProtocol {

    func routeToMvcScreen() {
        #warning ("Will be implemented!")
    }

    func routeToMvvmScreen() {
        #warning ("Will be implemented!")
    }

    func routeToViperScreen() {
        #warning ("Will be implemented!")
    }
}
