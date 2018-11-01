//
//  ArchitectureListPresenter.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 12/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListPresenter {

    enum Const {
        static let notViewed = "Not viewed yet"
        static let singleViewedFormat = "Viewed %d time"
        static let multipleViewedFormat = "Viewed %d times"
    }

    private let interactor: ArchitectureListInteractorInputProtocol

    private let router: ArchitectureListRoutingProtocol?

    weak var view: ArchitectureListViewProtocol?

    init(interactor: ArchitectureListInteractorInputProtocol,
         router: ArchitectureListRoutingProtocol?) {
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
            router?.routeToMvcScreen(title: type.title)
        case .mvvm:
            router?.routeToMvvmScreen(title: type.title)
        case .viper:
            router?.routeToViperScreen(title: type.title)
        }
    }
}

// MARK: - ArchitectureListInteractorOutputProtocol

extension ArchitectureListPresenter: ArchitectureListInteractorOutputProtocol {

    func architectureEntitiesPrepared(entities: [ArchitectureEntity]) {
        let presentations: [ArchitecturePresentation] = entities.map {
            var detail = ""

            if $0.viewCount == 0 {
                detail = Const.notViewed
            } else {
                let format = $0.viewCount == 1 ? Const.singleViewedFormat : Const.multipleViewedFormat
                detail = String(format: format, $0.viewCount)
            }

            return ArchitecturePresentation(title: $0.type.title,
                                            detail: detail)}
        view?.updateArchitecturePresentations(presentations: presentations)
    }
}
