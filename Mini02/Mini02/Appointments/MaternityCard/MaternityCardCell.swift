//
//  AntenatalViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardCell: UICollectionViewCell {
  
    var view = UIView()
    
    func setUpcell(view: UIView){
        self.view = view
        
        contentView.addSubview(view)
        view.anchorWithContantValues(top: self.topAnchor,left: self.leadingAnchor,right: self.trailingAnchor, bottom: self.bottomAnchor)
    }
    
    
}
