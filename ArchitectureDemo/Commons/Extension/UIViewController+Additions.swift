//
//  UIViewController+Additions.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 30/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func presentWarningAlert(message: String) {
        let alertController = UIAlertController(title: "Warning",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler:nil))
        present(alertController,
                animated: true,
                completion: nil)

    }
}
