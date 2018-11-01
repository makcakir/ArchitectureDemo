//
//  VIPERFibonacciPresenter.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

class VIPERFibonacciPresenter {

    enum Const {
        static let messageFormat = "%@ is not a fibonacci number!"
    }

    private let interactor: VIPERFibonacciInteractorInputProtocol

    private let formatter: NumberFormatter

    weak var view: VIPERFibonacciViewProtocol?

    init(interactor: VIPERFibonacciInteractorInputProtocol) {
        self.interactor = interactor
        self.formatter = NumberFormatter()
        self.formatter.numberStyle = .spellOut
    }
}

// MARK: - VIPERFibonacciPresentingProtocol

extension VIPERFibonacciPresenter: VIPERFibonacciPresentingProtocol {

    func prepareInitialPresentation() {
        interactor.retrieveInitialCounter()
    }

    func decrease() {
        interactor.decreaseCounter()
    }

    func increase() {
        interactor.increaseCounter()
    }
}

// MARK: - VIPERFibonacciInteractorOutputProtocol

extension VIPERFibonacciPresenter: VIPERFibonacciInteractorOutputProtocol {

    func counterUpdated(_ counter: Int) {
        let isFibonacci = counter.isFibonacciNumber()
        let numberValue = NSNumber(value: counter)
        let stringValue = formatter.string(from: numberValue)
        let labelColor = counter % 2 == 0 ? UIColor.yellow : UIColor.red
        let decreaseButtonEnabled = counter > 0

        let presentation = FibonacciPresentation(imageViewHidden: !isFibonacci,
                                                 integerLabelText: stringValue?.uppercased(),
                                                 integerLabelColor: labelColor,
                                                 decreaseButtonEnabled: decreaseButtonEnabled)
        view?.fibonacciPresentationUpdated(presentation)

        let message = isFibonacci ? nil : String(format: Const.messageFormat, stringValue?.capitalized ?? "")

        view?.alertMessageChanged(message)
    }
}
