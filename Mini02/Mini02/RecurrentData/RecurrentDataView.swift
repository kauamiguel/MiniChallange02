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
        title.font = title.font.withSize(30)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        return title
    }()
    
    let searchBar : UISearchBar = {
       let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Pesquise um campo aqui"
        search.searchBarStyle = .minimal
        search.showsCancelButton = false
        return search
    }()
    
    func setupView(vc : RecurrentDataViewController, collection : UICollectionView){

        //Adding the backgroundImage
        let bgImage = UIImage(named: "backGroundRecurrentData")
        guard let image = bgImage else {return}
        vc.view.backgroundColor = UIColor(patternImage: image)
        
        vc.view.addSubview(pageTitle)
        vc.view.addSubview(searchBar)
        
        pageTitle.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, left: vc.view.leadingAnchor, leftPadding: 20)
        
        searchBar.anchorWithConstantValues(top: pageTitle.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor ,topPadding: 10, leftPadding: 20, rightPadding: -20)
        
        collection.anchorWithConstantValues(top: searchBar.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, bottom: vc.view.bottomAnchor)
    }
}
