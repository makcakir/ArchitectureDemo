//
//  ArchitectureListInteractor.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListInteractor {
    
    private var entities: [ArchitectureEntity] = []
    
    weak var output: ArchitectureListInteractorOutputProtocol?
    
    init(architectureTypes: [ArchitectureType]) {
        self.entities = architectureTypes.map {
            let viewCount = UserDefaults.standard.integer(forKey:
                $0.userDefaultsKey.userDefaultsKeyWith(self))
            return ArchitectureEntity(type: $0, viewCount: viewCount)}
    }
}

// MARK: - ArchitectureListInteractorInputProtocol

extension ArchitectureListInteractor: ArchitectureListInteractorInputProtocol {
    
    func prepareArchitectureEntities() {
        output?.architectureEntitiesPrepared(entities: entities)
    }
    
    func increaseViewCount(type: ArchitectureType) {
        let increasedCount = entities[type.rawValue].viewCount + 1
        entities[type.rawValue] = ArchitectureEntity(type: type, viewCount: increasedCount)
        output?.architectureEntitiesPrepared(entities: entities)
        UserDefaults.standard.set(increasedCount, forKey: type.userDefaultsKey.userDefaultsKeyWith(self))
    }
}
