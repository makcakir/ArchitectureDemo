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
        viewController.viewModel = MVVMFibonacciViewModel()

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.pushViewController(viewController, animated: true)
    }

    func routeToViperScreen(title: String) {
        let interactor = VIPERFibonacciInteractor()

        let presenter = VIPERFibonacciPresenter(interactor: interactor)

        let viewController = VIPERFibonacciViewController()
        viewController.title = title
        viewController.presenter = presenter

        interactor.output = presenter
        presenter.view = viewController

        let navigationController = AppDelegate.shared.navigationController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
