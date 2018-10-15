//
//  FibonacciViewController.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 15/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

class FibonacciViewController: UIViewController {

    @IBOutlet weak var fibonacciImageView: UIImageView!
    @IBOutlet weak var integerLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: String(describing: FibonacciViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions

extension FibonacciViewController {

    @IBAction func decreaseButtonTapped(_ sender: UIButton) {

    }

    @IBAction func increaseButtonTapped(_ sender: UIButton) {
        
    }
}
