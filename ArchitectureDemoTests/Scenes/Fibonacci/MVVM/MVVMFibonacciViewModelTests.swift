//
//  MVVMFibonacciViewModelTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 30/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest
import Foundation

class MVVMFibonacciViewModelTests: XCTestCase {

    private var viewModel: MVVMFibonacciViewModel?
    private var view: MVVMFibonacciTestView?

    override func setUp() {
        viewModel = MVVMFibonacciViewModel()
        view = MVVMFibonacciTestView(viewModel: viewModel!)
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: MVVMFibonacciViewModel.Const.counterKey)
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
        viewModel?.increaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ONE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 2
        viewModel?.increaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TWO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 3
        viewModel?.increaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 4
        viewModel?.increaseCounter()

        let alertMessage = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 5
        viewModel?.increaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FIVE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 6
        viewModel?.increaseCounter()

        let alertMessage2 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Six")
        XCTAssertTrue(view?.alertMessage == alertMessage2)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SIX")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 7
        viewModel?.increaseCounter()

        let alertMessage3 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Seven")
        XCTAssertTrue(view?.alertMessage == alertMessage3)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SEVEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 8
        viewModel?.increaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "EIGHT")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 9
        viewModel?.increaseCounter()

        let alertMessage4 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Nine")
        XCTAssertTrue(view?.alertMessage == alertMessage4)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "NINE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 10
        viewModel?.increaseCounter()

        let alertMessage5 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Ten")
        XCTAssertTrue(view?.alertMessage == alertMessage5)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)
    }

    func testDecrease() {
        // First increase counter to 10
        for _ in 1...10 {
            viewModel?.increaseCounter()
        }

        let alertMessage = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Ten")
        XCTAssertTrue(view?.alertMessage == alertMessage)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 9
        viewModel?.decreaseCounter()

        let alertMessage2 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Nine")
        XCTAssertTrue(view?.alertMessage == alertMessage2)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "NINE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 8
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "EIGHT")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 7
        viewModel?.decreaseCounter()

        let alertMessage3 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Seven")
        XCTAssertTrue(view?.alertMessage == alertMessage3)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SEVEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 6
        viewModel?.decreaseCounter()

        let alertMessage4 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Six")
        XCTAssertTrue(view?.alertMessage == alertMessage4)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SIX")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 5
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FIVE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 4
        viewModel?.decreaseCounter()

        let alertMessage5 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage5)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 3
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 2
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "TWO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 1
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ONE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Make counter 0
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "ZERO")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == false)
    }

    func testFluctuate() {
        // Increase counter to 7
        for _ in 1...7 {
            viewModel?.increaseCounter()
        }

        let alertMessage = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Seven")
        XCTAssertTrue(view?.alertMessage == alertMessage)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "SEVEN")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Decrease counter to 3
        for _ in 1...4 {
            viewModel?.decreaseCounter()
        }

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Increase counter to 4
        viewModel?.increaseCounter()

        let alertMessage2 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage2)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Decrease counter to 3
        viewModel?.decreaseCounter()

        XCTAssertTrue(view?.alertMessage == nil)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == false)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "THREE")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.red)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)

        // Increase counter to 4
        viewModel?.increaseCounter()

        let alertMessage3 = String(format: MVVMFibonacciViewModel.Const.messageFormat, "Four")
        XCTAssertTrue(view?.alertMessage == alertMessage3)

        XCTAssertTrue(view?.fibonacciPresentation?.imageViewHidden == true)
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelText == "FOUR")
        XCTAssertTrue(view?.fibonacciPresentation?.integerLabelColor == UIColor.yellow)
        XCTAssertTrue(view?.fibonacciPresentation?.decreaseButtonEnabled == true)
    }
}
