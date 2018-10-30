//
//  MVVMFibonacciViewModel.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 26/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

typealias FibonacciPresentation = (imageViewHidden: Bool,
                                   integerLabelText: String,
                                   integerLabelColor: UIColor,
                                   decreaseButtonEnabled: Bool)

class MVVMFibonacciViewModel {

    enum Change {
        case presentation(presentation: FibonacciPresentation)
        case alert(message: String)
    }

    private enum Const {
        static let counterKey = "com.makcakir.ArchitectureDemo.counter.mvvm"
    }

    private let formatter: NumberFormatter

    private var counter: Int

    var changeHandler: ((Change) -> Void)? {
        didSet { handleCounterChange() }
    }

    init() {
        formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        counter = UserDefaults.standard.integer(forKey: Const.counterKey)
    }

    func decreaseCounter() {
        counter -= 1
        handleCounterChange()
    }

    func increaseCounter() {
        counter += 1
        handleCounterChange()
    }

    private func handleCounterChange() {
        let isFibonacci = counter.isFibonacciNumber()
        let numberValue = NSNumber(value: counter)
        let stringValue = formatter.string(from: numberValue) ?? ""
        let labelColor = counter % 2 == 0 ? UIColor.yellow : UIColor.red
        let decreaseButtonEnabled = counter > 0

        let presentation = FibonacciPresentation(imageViewHidden: !isFibonacci,
                                                 integerLabelText: stringValue.uppercased(),
                                                 integerLabelColor: labelColor,
                                                 decreaseButtonEnabled: decreaseButtonEnabled)
        changeHandler?(.presentation(presentation: presentation))

        if !isFibonacci {
            let message = String(format: "%@ is not a fibonacci number!", stringValue.capitalized)
            changeHandler?(.alert(message: message))
        }

        UserDefaults.standard.set(counter, forKey: Const.counterKey)
    }
}
