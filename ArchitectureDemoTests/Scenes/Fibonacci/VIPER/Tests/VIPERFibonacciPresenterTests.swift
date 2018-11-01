//
//  VIPERFibonacciPresenterTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest

class VIPERFibonacciPresenterTests: XCTestCase {

    private var presenter: VIPERFibonacciPresenter?
    private var interactor: VIPERFibonacciInteractor?
    private var view: VIPERFibonacciTestView?

    override func setUp() {
        interactor = VIPERFibonacciInteractor()
        presenter = VIPERFibonacciPresenter(interactor: interactor!)
        view = VIPERFibonacciTestView(presenter: presenter!)

        interactor?.output = presenter
        presenter?.view = view

        presenter?.prepareInitialPresentation()
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey:
            VIPERFibonacciInteractor.Const.counterKey.userDefaultsKeyWith(self))
    }

    func testInitialState() {
        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ZERO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == false)
    }

    func testIncrease() {
        // Make counter 1
        presenter?.increase()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ONE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 2
        presenter?.increase()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TWO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 3
        presenter?.increase()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 4
        presenter?.increase()

        let alertMessage = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 5
        presenter?.increase()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FIVE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 6
        presenter?.increase()

        let alertMessage2 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Six")
        XCTAssertTrue(view?.alertMessage == alertMessage2)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SIX")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 7
        presenter?.increase()

        let alertMessage3 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Seven")
        XCTAssertTrue(view?.alertMessage == alertMessage3)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SEVEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 8
        presenter?.increase()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "EIGHT")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 9
        presenter?.increase()

        let alertMessage4 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Nine")
        XCTAssertTrue(view?.alertMessage == alertMessage4)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "NINE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 10
        presenter?.increase()

        let alertMessage5 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Ten")
        XCTAssertTrue(view?.alertMessage == alertMessage5)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)
    }

    func testDecrease() {
        // First increase counter to 10
        for _ in 1...10 {
            presenter?.increase()
        }

        let alertMessage = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Ten")
        XCTAssertTrue(view?.alertMessage == alertMessage)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 9
        presenter?.decrease()

        let alertMessage2 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Nine")
        XCTAssertTrue(view?.alertMessage == alertMessage2)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "NINE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 8
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "EIGHT")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 7
        presenter?.decrease()

        let alertMessage3 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Seven")
        XCTAssertTrue(view?.alertMessage == alertMessage3)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SEVEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 6
        presenter?.decrease()

        let alertMessage4 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Six")
        XCTAssertTrue(view?.alertMessage == alertMessage4)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SIX")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 5
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FIVE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 4
        presenter?.decrease()

        let alertMessage5 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage5)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 3
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 2
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TWO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 1
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ONE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 0
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ZERO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == false)
    }

    func testFluctuate() {
        // Increase counter to 7
        for _ in 1...7 {
            presenter?.increase()
        }

        let alertMessage = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Seven")
        XCTAssertTrue(view?.alertMessage == alertMessage)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SEVEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Decrease counter to 3
        for _ in 1...4 {
            presenter?.decrease()
        }

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Increase counter to 4
        presenter?.increase()

        let alertMessage2 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage2)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Decrease counter to 3
        presenter?.decrease()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Increase counter to 4
        presenter?.increase()

        let alertMessage3 = String(format: VIPERFibonacciPresenter.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage3)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)
    }
}
