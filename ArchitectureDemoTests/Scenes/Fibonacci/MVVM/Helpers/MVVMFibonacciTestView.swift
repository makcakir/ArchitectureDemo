//
//  MVVMFibonacciTestView.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 30/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class MVVMFibonacciTestView {

    private let viewModel: MVVMFibonacciViewModel

    private(set) var fibonacciPresentation: FibonacciPresentation?

    private(set) var alertMessage: String?

    init(viewModel: MVVMFibonacciViewModel) {
        self.viewModel = viewModel
        self.viewModel.changeHandler = { [unowned self] change in
            self.applyChange(change)
        }
    }
}

private extension MVVMFibonacciTestView {

    func applyChange(_ change: MVVMFibonacciViewModel.Change) {
        switch change {
        case .presentation(let presentation):
            fibonacciPresentation = presentation
        case .alert(let message):
            alertMessage = message
        }
    }
}
