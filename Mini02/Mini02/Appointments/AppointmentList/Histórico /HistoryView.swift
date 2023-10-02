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
        vc.view.backgroundColor = .white
   
        let date = dateLabel
        let text = titleLabel
        
        vc.view.addSubview(date)
        vc.view.addSubview(text)
        
        text.anchorWithConstantValues(left: vc.view.leadingAnchor,right: vc.view.trailingAnchor)
        text.centerY(inView: vc.view)
        
   
        date.anchorWithConstantValues(top: text.bottomAnchor,left: vc.view.leadingAnchor,right: vc.view.trailingAnchor)
    
    }
    
    let titleLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont(name: "Signika-Regular", size: 24)
         label.textAlignment = .center
         return label
     }()
     
    let dateLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont(name: "Signika-Regular", size: 16)
         label.textAlignment = .center
         return label
     }()
    
}
