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
        table.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        return table
    }()
    
    func setupProfile(vc: UIViewController) {
        self.viewController = vc
        vc.view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
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
