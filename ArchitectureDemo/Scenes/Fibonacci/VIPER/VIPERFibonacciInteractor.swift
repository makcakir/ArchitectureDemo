//
//  VIPERFibonacciInteractor.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class VIPERFibonacciInteractor {

    enum Const {
        static let counterKey = "counter.viper"
    }

    private var counter: Int = 0 {
        didSet {
            output?.counterUpdated(counter)
            UserDefaults.standard.set(counter, forKey: Const.counterKey.userDefaultsKeyWith(self))
        }
    }

    weak var output: VIPERFibonacciInteractorOutputProtocol?
}

// MARK: - VIPERFibonacciInteractorInputProtocol

extension VIPERFibonacciInteractor: VIPERFibonacciInteractorInputProtocol {

    func retrieveInitialCounter() {
        counter = UserDefaults.standard.integer(forKey: Const.counterKey.userDefaultsKeyWith(self))
    }

    func decreaseCounter() {
        counter -= 1
    }

    func increaseCounter() {
        counter += 1
    }
}
