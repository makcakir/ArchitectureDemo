//
//  VIPERFibonacci.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

protocol VIPERFibonacciInteractorInputProtocol {
    func retrieveInitialCounter()
    func decreaseCounter()
    func increaseCounter()
}

protocol VIPERFibonacciInteractorOutputProtocol: AnyObject {
    func counterUpdated(_ counter: Int)
}

protocol VIPERFibonacciPresentingProtocol {
    func prepareInitialPresentation()
    func decrease()
    func increase()
}

protocol VIPERFibonacciViewProtocol: AnyObject {
    func fibonacciPresentationUpdated(_ presentation: FibonacciPresentation)
    func alertMessageChanged(_ alertMessage: String?)
}
