//
//  ArchitectureListViewController.swift
//  ArchitectureDemo
//
//  Created by Mustafa Ali Akçakır on 10/10/2018.
//  Copyright © 2018 Mustafa Ali Akçakır. All rights reserved.
//

import Foundation
import UIKit

class ArchitectureListViewController: UITableViewController {

    private enum Const {
        static let cellIdentifier = "ArchitectureCell"
    }

    var presenter: ArchitectureListPresentingProtocol?

    private var presentations: [ArchitecturePresentation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter?.prepareArchitecturePresentations()
    }
}

// MARK: - Setup

private extension ArchitectureListViewController {

    func initializeViews() {
        title = "Architecture Demo"
        tableView.tableFooterView = UIView()
    }
}

// MARK: - ArchitectureListViewProtocol

extension ArchitectureListViewController: ArchitectureListViewProtocol {

    func updateArchitecturePresentations(presentations: [ArchitecturePresentation]) {
        self.presentations = presentations
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ArchitectureListViewController {

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return presentations.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: Const.cellIdentifier)
            cell?.accessoryType = .disclosureIndicator
        }

        let presentation = presentations[indexPath.row]

        cell?.textLabel?.text = presentation.title
        cell?.detailTextLabel?.text = presentation.detail

        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension ArchitectureListViewController {

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        guard let type = ArchitectureType(rawValue: indexPath.row) else {
            return
        }
        presenter?.selectArchitecture(type: type)
    }
}
