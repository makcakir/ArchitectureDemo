//
//  ArchitectureListInteractorTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest

class ArchitectureListInteractorTests: XCTestCase {

    private var interactor: ArchitectureListInteractor?
    private var presenter: VIPERArchitectureListTestPresenter?
    private let types: [ArchitectureType] = [.mvc, .mvvm, .viper]

    override func setUp() {
        presenter = VIPERArchitectureListTestPresenter()
        interactor = ArchitectureListInteractor(architectureTypes: types)
        interactor?.output = presenter

        interactor?.prepareArchitectureEntities()
    }

    override func tearDown() {
        for type in types {
            UserDefaults.standard.removeObject(forKey: type.userDefaultsKey.userDefaultsKeyWith(self))
        }
    }

    func testInitialState() {
        XCTAssertTrue(presenter?.entities.count == 3)

        XCTAssertTrue(presenter?.entities[0].type == ArchitectureType.mvc)
        XCTAssertTrue(presenter?.entities[1].type == ArchitectureType.mvvm)
        XCTAssertTrue(presenter?.entities[2].type == ArchitectureType.viper)

        for entity in (presenter?.entities)! {
            XCTAssertTrue(entity.viewCount == 0)
        }
    }

    func testIncreaseViewCount() {
        for type in types {
            interactor?.increaseViewCount(type: type)
        }

        for entity in (presenter?.entities)! {
            XCTAssertTrue(entity.viewCount == 1)
        }

        for type in types {
            interactor?.increaseViewCount(type: type)
        }

        for entity in (presenter?.entities)! {
            XCTAssertTrue(entity.viewCount == 2)
        }
    }
}
