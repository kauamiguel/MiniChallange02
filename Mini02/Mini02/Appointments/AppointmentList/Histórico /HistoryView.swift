//
//  HistoryView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import UIKit

class HistoryView: UIView {
    
    var controller:UIViewController? 
    
    
    func setupView(){
        guard let vc = controller else{
            fatalError("No view controller was passed")
        }
        self.backgroundColor = .red
        vc.view.addSubview(self)
        self.anchorWithConstantValues(
            top: vc.view.topAnchor,
                                           
            left: vc.view.leadingAnchor,
                                           
            right: vc.view.trailingAnchor,
                                           
            bottom: vc.view.bottomAnchor
        )
    }
}
