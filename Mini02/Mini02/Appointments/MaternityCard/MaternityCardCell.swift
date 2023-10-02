//
//  AntenatalViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardCell: UICollectionViewCell {
    
    func setUpcell(view: UIView?){
        if let view = view{
            contentView.addSubview(view)
            view.anchorWithConstantValues(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        contentView.endEditing(true)
    }
}
