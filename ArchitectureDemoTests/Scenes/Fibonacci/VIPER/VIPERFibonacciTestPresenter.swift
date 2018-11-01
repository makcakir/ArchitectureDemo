//
//  VIPERFibonacciTestPresenter.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class VIPERFibonacciTestPresenter {
    private(set) var counter: Int = 0
}

// MARK: - VIPERFibonacciInteractorOutputProtocol

extension VIPERFibonacciTestPresenter: VIPERFibonacciInteractorOutputProtocol {

    func counterUpdated(_ counter: Int) {
        self.counter = counter
    }
}
