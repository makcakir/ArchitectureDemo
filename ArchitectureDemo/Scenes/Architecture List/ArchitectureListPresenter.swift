//
//  ArchitectureListPresenter.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 12/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListPresenter {

    private let interactor: ArchitectureListInteractorInputProtocol

    private let router: ArchitectureListRoutingProtocol

    weak var view: ArchitectureListViewProtocol?

    init(interactor: ArchitectureListInteractorInputProtocol,
         router: ArchitectureListRoutingProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - ArchitectureListPresentingProtocol

extension ArchitectureListPresenter: ArchitectureListPresentingProtocol {

    func prepareArchitecturePresentations() {
        interactor.prepareArchitectureEntities()
    }

    func selectArchitecture(type: ArchitectureType) {
        interactor.increaseViewCount(type: type)
        switch type {
        case .mvc:
            router.routeToMvcScreen(title: type.title)
        case .mvvm:
            router.routeToMvvmScreen(title: type.title)
        case .viper:
            router.routeToViperScreen(title: type.title)
        }
    }
}

// MARK: - ArchitectureListInteractorOutputProtocol

extension ArchitectureListPresenter: ArchitectureListInteractorOutputProtocol {

    func architectureEntitiesPrepared(entities: [ArchitectureEntity]) {
        let presentations: [ArchitecturePresentation] = entities.map {
            ArchitecturePresentation(title: $0.type.title,
                                     detail: String.init(format: "Preview count: %d", $0.viewCount))}
        view?.updateArchitecturePresentations(presentations: presentations)
    }
}
