//
//  VIPERFibonacciTestView.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class VIPERFibonacciTestView {

    private let presenter: VIPERFibonacciPresenter

    private(set) var fibonacciPresentation: FibonacciPresentation?

    private(set) var alertMessage: String?

    init(presenter: VIPERFibonacciPresenter) {
        self.presenter = presenter
    }
}

extension VIPERFibonacciTestView: VIPERFibonacciViewProtocol {

    func fibonacciPresentationUpdated(_ presentation: FibonacciPresentation) {
        fibonacciPresentation = presentation
    }

    func alertMessageChanged(_ alertMessage: String?) {
        self.alertMessage = alertMessage
    }
}
