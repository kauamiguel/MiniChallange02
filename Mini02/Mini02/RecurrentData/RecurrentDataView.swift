//
//  RecurrentDataView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class RecurrentDataView: UIView {
    
    let pageTitle : UILabel = {
        var title = UILabel()
        title.text = "Dados recorrentes"
        title.textColor = .cyan
        title.font = title.font.withSize(20)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        return title
    }()
    
    let searchController : UISearchController = {
       let search = UISearchController()
        search.searchBar.translatesAutoresizingMaskIntoConstraints = false
        search.searchBar.backgroundColor = .red
        return search
    }()
    
    func setupView(vc : RecurrentDataViewController){
        
        vc.view.backgroundColor = .white
    
        vc.view.addSubview(searchController.searchBar)
        vc.view.addSubview(pageTitle)
        
        pageTitle.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, left: vc.view.leadingAnchor, leftPadding: 20)
        
        searchController.searchBar.anchorWithConstantValues(top: pageTitle.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor ,topPadding: 10, leftPadding: 20, rightPadding: -20)
        
    }
}
