//
//  ArchitectureListTestView.swift
//  ArchitectureDemoTests
//
//  Created by Mustafa Ali Akçakır on 01/11/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation

class ArchitectureListTestView {
    private(set) var presentations: [ArchitecturePresentation] = []
}

extension ArchitectureListTestView: ArchitectureListViewProtocol {

    func updateArchitecturePresentations(presentations: [ArchitecturePresentation]) {
        self.presentations = presentations
    }
}
