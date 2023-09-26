//
//  ProfileViewController+UITableViewDelegate+UITableViewDataSource.swift
//  Mini02
//
//  Created by Fabio Freitas on 26/09/23.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.links.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileListCell.identifier) as? ProfileListCell, let viewModel else { return UITableViewCell() }
        cell.setCellName(name: viewModel.links[indexPath.row].name)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewModel {
            let selected = viewModel.links[indexPath.row]
            if selected.isModal {
                present(selected.vc, animated: true)
            } else {
                self.navigationController?.pushViewController(PregnantDataViewController(), animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
