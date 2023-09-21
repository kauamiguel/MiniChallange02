//
//  AntenatalViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardCell: UICollectionViewCell {
    
    let defaultView = DefaultView()
    
    
    func setUpcell(view: UIView){
        defaultView.frame = contentView.bounds
        contentView.addSubview(view)
        view.anchorWithConstantValues(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, bottom: contentView.bottomAnchor)
        
        for constraint in contentView.constraints {
            if constraint.firstItem === defaultView || constraint.secondItem === defaultView {
                contentView.removeConstraint(constraint)
            }
        }
    }
    
    
}
