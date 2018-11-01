//
//  VIPERFibonacciViewController.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import UIKit

class VIPERFibonacciViewController: FibonacciViewController {

    var presenter: VIPERFibonacciPresentingProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.prepareInitialPresentation()
    }

    override func decreaseButtonTapped(_ sender: UIButton) {
        presenter?.decrease()
    }

    override func increaseButtonTapped(_ sender: UIButton) {
        presenter?.increase()
    }
}

extension VIPERFibonacciViewController: VIPERFibonacciViewProtocol {

    func fibonacciPresentationUpdated(_ presentation: FibonacciPresentation) {
        fibonacciImageView.isHidden = presentation.imageViewHidden
        integerLabel.text = presentation.integerLabelText
        integerLabel.textColor = presentation.integerLabelColor
        decreaseButton.isEnabled = presentation.decreaseButtonEnabled
    }

    func alertMessageChanged(_ alertMessage: String?) {
        guard let message = alertMessage else {
            return
        }
        presentWarningAlert(message: message)
    }
}
