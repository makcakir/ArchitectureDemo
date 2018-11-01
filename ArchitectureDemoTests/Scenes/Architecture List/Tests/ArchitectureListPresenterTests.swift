//
//  ArchitectureListPresenterTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest

class ArchitectureListPresenterTests: XCTestCase {

    private var presenter: ArchitectureListPresenter?
    private var interactor: ArchitectureListInteractor?
    private var view: ArchitectureListTestView?
    private let types: [ArchitectureType] = [.mvc, .mvvm, .viper]

    override func setUp() {
        interactor = ArchitectureListInteractor(architectureTypes: types)
        presenter = ArchitectureListPresenter(interactor: interactor!,
                                              router: nil)
        view = ArchitectureListTestView()

        interactor?.output = presenter
        presenter?.view = view

        interactor?.prepareArchitectureEntities()
    }

    override func tearDown() {
        for type in types {
            UserDefaults.standard.removeObject(forKey: type.userDefaultsKey.userDefaultsKeyWith(self))
        }
    }

    func testInitialState() {
        XCTAssertTrue(view?.presentations.count == 3)

        XCTAssertTrue(view?.presentations[0].title == "MVC")
        XCTAssertTrue(view?.presentations[1].title == "MVVM")
        XCTAssertTrue(view?.presentations[2].title == "VIPER")

        for presentation in (view?.presentations)! {
            XCTAssertTrue(presentation.detail == ArchitectureListPresenter.Const.notViewed)
        }
    }

    func testViewedDetails() {
        presenter?.selectArchitecture(type: ArchitectureType.mvc)

        XCTAssertTrue(view?.presentations[0].detail == String(format: ArchitectureListPresenter.Const.singleViewedFormat, 1))

        presenter?.selectArchitecture(type: ArchitectureType.mvvm)
        presenter?.selectArchitecture(type: ArchitectureType.mvvm)

        XCTAssertTrue(view?.presentations[1].detail == String(format: ArchitectureListPresenter.Const.multipleViewedFormat, 2))
    }
}
