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
        fibonacciImageView.isHidden = !counter.isFibonacciNumber()

        let numberValue = NSNumber(value: counter)
        integerLabel.text = formatter.string(from: numberValue)?.uppercased()
        integerLabel.textColor = counter % 2 == 0 ? UIColor.yellow : UIColor.red

        decreaseButton.isEnabled = counter > 0
    }

    func handleCounterChange() {
        UserDefaults.standard.set(counter, forKey: Const.counterKey)
        updateViews()
    }
}
