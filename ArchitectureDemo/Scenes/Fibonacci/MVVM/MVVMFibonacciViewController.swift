//
//  MVVMFibonacciViewController.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import UIKit

class MVVMFibonacciViewController: FibonacciViewController {

    var viewModel: MVVMFibonacciViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }

    override func decreaseButtonTapped(_ sender: UIButton) {
        viewModel.decreaseCounter()
    }

    override func increaseButtonTapped(_ sender: UIButton) {
        viewModel.increaseCounter()
    }
}

private extension MVVMFibonacciViewController {

    func bindViewModel() {
        viewModel.changeHandler = { [unowned self] change in
            self.applyChange(change)
        }
    }

    func applyChange(_ change: MVVMFibonacciViewModel.Change) {
        switch change {
        case .presentation(let presentation):
            fibonacciImageView.isHidden = presentation.imageViewHidden
            integerLabel.text = presentation.integerLabelText
            integerLabel.textColor = presentation.integerLabelColor
            decreaseButton.isEnabled = presentation.decreaseButtonEnabled
        case .alert(let message):
            presentWarningAlert(message: message)
        }
    }
}
