//
//  IntTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest

class IntTests: XCTestCase {

    func testFibonnacci() {
        XCTAssertTrue(0.isFibonacciNumber() == true)
        XCTAssertTrue(1.isFibonacciNumber() == true)
        XCTAssertTrue(2.isFibonacciNumber() == true)
        XCTAssertTrue(3.isFibonacciNumber() == true)
        XCTAssertTrue(4.isFibonacciNumber() == false)
        XCTAssertTrue(5.isFibonacciNumber() == true)
        XCTAssertTrue(6.isFibonacciNumber() == false)
        XCTAssertTrue(10.isFibonacciNumber() == false)
        XCTAssertTrue(13.isFibonacciNumber() == true)
        XCTAssertTrue(15.isFibonacciNumber() == false)
        XCTAssertTrue(21.isFibonacciNumber() == true)
        XCTAssertTrue(27.isFibonacciNumber() == false)
        XCTAssertTrue(34.isFibonacciNumber() == true)
    }
}
