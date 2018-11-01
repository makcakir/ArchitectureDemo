//
//  StringTests.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    func testUserDefaultsKey() {
        XCTAssertTrue("makcakir".userDefaultsKeyWith(self) == "com.makcakir.ArchitectureDemoTests.makcakir")
        XCTAssertTrue("123456".userDefaultsKeyWith(self) == "com.makcakir.ArchitectureDemoTests.123456")
        XCTAssertTrue("123qwe".userDefaultsKeyWith(self) == "com.makcakir.ArchitectureDemoTests.123qwe")
    }
}
