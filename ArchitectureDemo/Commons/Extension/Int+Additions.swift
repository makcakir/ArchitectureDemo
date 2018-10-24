//
//  Int+Additions.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 24/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

extension Int {

    func isFibonacciNumber() -> Bool {
        let checkValue = 5 * self * self
        let firstControlValue = checkValue + 4
        let secondControlValue = checkValue - 4
        return firstControlValue.isPerfectSquare() || secondControlValue.isPerfectSquare()
    }

    private func isPerfectSquare() -> Bool {
        let checkValue = Int(sqrt(Double(self)))
        return (checkValue * checkValue) == self
    }
}
