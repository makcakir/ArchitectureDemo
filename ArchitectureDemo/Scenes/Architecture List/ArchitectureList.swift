//
//  ArchitectureList.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 11/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

typealias ArchitectureEntity = (type: ArchitectureType, viewCount: Int)
typealias ArchitecturePresentation = (title: String, detail: String)

enum ArchitectureType: Int {
    case mvc
    case mvvm
    case viper

    var title: String {
        switch self {
        case .mvc:
            return "MVC"
        case .mvvm:
            return "MVVM"
        case .viper:
            return "VIPER"
        }
    }

    var userDefaultsKey: String {
        switch self {
        case .mvc:
            return "viewCount.mvc"
        case .mvvm:
            return "viewCount.mvvm"
        case .viper:
            return "viewCount.viper"
        }
    }
}

protocol ArchitectureListInteractorInputProtocol {
    func prepareArchitectureEntities()
    func increaseViewCount(type: ArchitectureType)
}

protocol ArchitectureListInteractorOutputProtocol: AnyObject {
    func architectureEntitiesPrepared(entities: [ArchitectureEntity])
}

protocol ArchitectureListPresentingProtocol {
    func prepareArchitecturePresentations()
    func selectArchitecture(type: ArchitectureType)
}

protocol ArchitectureListRoutingProtocol {
    func routeToMvcScreen(title: String)
    func routeToMvvmScreen(title: String)
    func routeToViperScreen(title: String)
}

protocol ArchitectureListViewProtocol: AnyObject {
    func updateArchitecturePresentations(presentations: [ArchitecturePresentation])
}
