//
//  ArchitectureListInteractor.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListInteractor {

    weak var output: ArchitectureListInteractorOutputProtocol?
}

extension ArchitectureListInteractor: ArchitectureListInteractorInputProtocol {

    func prepareArchitectureEntities() {
        #warning ("Read preview count from user defaults!")
        let entities: [ArchitectureEntity] = [ArchitectureEntity(type: .mvc, previewCount: 0),
                                              ArchitectureEntity(type: .mvvm, previewCount: 0),
                                              ArchitectureEntity(type: .viper, previewCount: 0)]
        output?.architectureEntitiesPrepared(entities: entities)
    }
}
