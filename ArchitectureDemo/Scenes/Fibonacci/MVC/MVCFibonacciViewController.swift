//
//  MVCFibonacciViewController.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

class MVCFibonacciViewController: FibonacciViewController {

    private enum Const {
        static let counterKey = "com.makcakir.ArchitectureDemo.counter.mvc"
    }

    private var counter: Int = 0
    private let formatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        counter = UserDefaults.standard.integer(forKey: Const.counterKey)
        formatter.numberStyle = .spellOut
        updateViews()
    }

    override func decreaseButtonTapped(_ sender: UIButton) {
        super.decreaseButtonTapped(sender)

        counter -= 1
        handleCounterChange()
    }

    override func increaseButtonTapped(_ sender: UIButton) {
        super.increaseButtonTapped(sender)

        counter += 1
        handleCounterChange()
    }
}

private extension MVCFibonacciViewController {

    func updateViews() {
        let numberValue = NSNumber(value: counter)
        let stringValue = formatter.string(from: numberValue) ?? ""

        if counter.isFibonacciNumber() {
            fibonacciImageView.isHidden = false
        } else {
            fibonacciImageView.isHidden = true
            let message = String(format: "%@ is not a fibonacci number!",
                                 stringValue.capitalized)
            presentWarningAlert(message: message)
        }

        integerLabel.text = stringValue.uppercased()

        if counter % 2 == 0 {
            integerLabel.textColor = UIColor.yellow
        } else {
            integerLabel.textColor = UIColor.red
        }

        if counter > 0 {
            decreaseButton.isEnabled = true
        } else {
            decreaseButton.isEnabled = false
        }
    }

    func handleCounterChange() {
        UserDefaults.standard.set(counter, forKey: Const.counterKey)
        updateViews()
    }
}
