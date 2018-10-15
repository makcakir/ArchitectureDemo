//
//  ArchitectureDemoInitializationProtocol.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

protocol ArchitectureDemoInitializationProtocol {
    func initializeDemoScreen()
}

extension ArchitectureDemoInitializationProtocol {

    func initializeDemoScreen() {
        let interactor = ArchitectureListInteractor()

        let presenter = ArchitectureListPresenter(interactor: interactor,
                                                  router: ArchitectureListRouter())

        let viewController = ArchitectureListViewController()
        viewController.presenter = presenter

        interactor.output = presenter
        presenter.view = viewController

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.viewControllers = [viewController]
    }
}

class ArchitectureDemoInitializer: ArchitectureDemoInitializationProtocol { }

