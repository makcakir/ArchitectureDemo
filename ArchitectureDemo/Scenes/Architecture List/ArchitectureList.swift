//
//  ArchitectureList.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 11/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

typealias ArchitecturePresentation = (title: String, detail: String)

enum ArchitectureType: Int {
    case mvc
    case mvvm
    case viper
}

protocol ArchitectureListPresentingProtocol {
    func selectArchitecture(type: ArchitectureType)
}

protocol ArchitectureListRoutingProtocol {
    func routeToMvcScreen()
    func routeToMvvmScreen()
    func routeToViperScreen()
}
