//
//  String+Additions.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

extension String {

    func userDefaultsKeyWith(_ object: AnyObject) -> String {
        let bundleId = Bundle(for: type(of: object)).bundleIdentifier ?? ""
        return String(format: "%@.%@", bundleId, self)
    }
}
