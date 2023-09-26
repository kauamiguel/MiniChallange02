//
//  ProfileView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class ProfileView: UIControl {
    var viewController: UIViewController?
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.register(ProfileListCell.self, forCellReuseIdentifier: ProfileListCell.identifier)
        return table
    }()
    
    func setupProfile(vc: UIViewController) {
        self.viewController = vc
        vc.view.backgroundColor = .systemBackground
        vc.title = "Perfil"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.view.addSubview(tableView)
        tableView.dataSource = vc as? any UITableViewDataSource
        tableView.delegate = vc as? any UITableViewDelegate
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableHeaderView = UIView()
        tableView.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, left: vc.view.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, bottom:vc.view.safeAreaLayoutGuide.bottomAnchor, topPadding: 56, leftPadding: 30, rightPadding: -30)
    }
}
