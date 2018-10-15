//
//  ArchitectureListInteractor.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListInteractor {
    
    private let types: [ArchitectureType] = [.mvc, .mvvm, .viper]
    
    weak var output: ArchitectureListInteractorOutputProtocol?
}

extension ArchitectureListInteractor: ArchitectureListInteractorInputProtocol {
    
    func prepareArchitectureEntities() {
        let entities: [ArchitectureEntity] = types.map {
            ArchitectureEntity(type: $0,
                               viewCount: UserDefaults.standard.integer(forKey: $0.userDefaultsKey))}
        output?.architectureEntitiesPrepared(entities: entities)
    }
    
    func increaseViewCount(type: ArchitectureType) {
        let viewCount = UserDefaults.standard.integer(forKey: type.userDefaultsKey)
        UserDefaults.standard.set(viewCount + 1, forKey: type.userDefaultsKey)
    }
}
