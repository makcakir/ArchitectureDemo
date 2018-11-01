//
//  VIPERFibonacciInteractorTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest

class VIPERFibonacciInteractorTests: XCTestCase {

    private var interactor: VIPERFibonacciInteractor?
    private var presenter: VIPERFibonacciTestPresenter?

    override func setUp() {
        presenter = VIPERFibonacciTestPresenter()
        interactor = VIPERFibonacciInteractor()
        interactor?.output = presenter
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey:
            VIPERFibonacciInteractor.Const.counterKey.userDefaultsKeyWith(self))
    }

    func testInitialCounter() {
        interactor?.retrieveInitialCounter()
        XCTAssertTrue(presenter?.counter == 0)
    }

    func testIncreaseCounter() {
        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 1)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 2)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 3)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 4)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 5)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 6)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 7)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 8)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 9)

        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 10)
    }

    func testdecreaseCounter() {
        // First increase counter to 10
        for _ in 1...10 {
            interactor?.increaseCounter()
        }

        XCTAssertTrue(presenter?.counter == 10)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 9)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 8)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 7)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 6)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 5)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 4)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 3)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 2)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 1)

        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 0)
    }

    func testFluctuateCounter() {
        // Increase counter to 7
        for _ in 1...7 {
            interactor?.increaseCounter()
        }

        XCTAssertTrue(presenter?.counter == 7)

        // Decrease counter to 3
        for _ in 1...4 {
            interactor?.decreaseCounter()
        }

        XCTAssertTrue(presenter?.counter == 3)

        // Increase counter to 4
        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 4)

        // Decrease counter to 3
        interactor?.decreaseCounter()
        XCTAssertTrue(presenter?.counter == 3)

        // Increase counter to 4
        interactor?.increaseCounter()
        XCTAssertTrue(presenter?.counter == 4)
    }
}
