//
//  ArchitectureListPresenter.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 12/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListPresenter {

    let router: ArchitectureListRoutingProtocol

    init(router: ArchitectureListRoutingProtocol) {
        self.router = router
    }
}

extension ArchitectureListPresenter: ArchitectureListPresentingProtocol {

    func selectArchitecture(type: ArchitectureType) {
        switch type {
        case .mvc:
            router.routeToMvcScreen()
        case .mvvm:
            router.routeToMvvmScreen()
        case .viper:
            router.routeToViperScreen()
        }
    }
}
