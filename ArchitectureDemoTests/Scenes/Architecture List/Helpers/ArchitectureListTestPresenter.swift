//
//  VIPERArchitectureListTestPresenter.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class VIPERArchitectureListTestPresenter {
    private(set) var entities: [ArchitectureEntity] = []
}

// MARK: - ArchitectureListInteractorOutputProtocol

extension VIPERArchitectureListTestPresenter: ArchitectureListInteractorOutputProtocol {

    func architectureEntitiesPrepared(entities: [ArchitectureEntity]) {
        self.entities = entities
    }
}
